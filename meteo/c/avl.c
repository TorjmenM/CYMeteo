# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include <string.h>
# include "csort.h"
# include "binary_tree.h"
# include "bst.h"
# include "avl.h"

///////////////////////     Insertion     ///////////////////////

/* 
Function that inserts a node with a certain element in an AVL
Arguments: 
- t: pointer to the Tree structure (pTree)
- f: pointer to the field representing the added node (pField)
- h: pointer to the height (int*)
Return (pTree): pointer to the Tree structure of the inserted node (pTree)
*/
pTree avlInsertion(pTree t, pField f, int* h){
    field_type v = f[keycolumn].value;
    if(isEmpty(t)){
        *h = 1;
        return createTree(f);
    }
    else if(t->elmt > v){
        t->lc = avlInsertion(t->lc, f, h);
        *h = -(*h);
    }
    else if(t->elmt < v){
        t->rc = avlInsertion(t->rc, f, h);
    }
    else 
    {
        *h = 0;

        // case of equal key : we need to process stats if asked by the user
        
        updateStats (t->fields, f);

        return t;
    }
    if(*h != 0){
      t->balance = t->balance + *h;
      pTree tprime = t;
      t = balanceAVL(t);
      if(tprime == pRoot) pRoot = t;
      if(t->balance == 0){
        *h = 0;
      }
      else
      {
        *h = 1;
      }
    }
    return t;
}

///////////////////////     Deletion     ///////////////////////

/* 
Function that removes the node with the minimum value from an AVL
Arguments: 
- t: pointer to the Tree structure (pTree)
- h: pointer to the height (int*)
- pelmt: pointer to the element of the Tree structure (field_type*)
Return (pTree): pointer to the Tree structure (pTree)
*/
pTree avlMinDelete(pTree t, int* h, field_type *pelmt){
    pTree tmp;
    if(isEmpty(t->lc)){ // No left child anymore
        *pelmt = t->elmt; // Found the smallest value of the tree
        *h = -1; 
        tmp = t;
        t = t->rc; // Substitute the current node by the right child
        free(tmp); // Free the memory of the node
        return t;
    }
    else 
    {
        t->lc = avlMinDelete(t->lc, h, pelmt); // Recursive call on the left subtree
        *h = -*h;   
    }
    if(*h != 0){
        t->balance = t->balance + *h; // Update of the balancing factor
        if(t->balance == 0){
            *h = -1;
        } 
        else
        {
            *h = 0;
        }
    }
    return t;
}

/* 
Function that removes a node with a certain element from an AVL
Arguments: 
- t: pointer to the Tree structure (pTree)
- v: element of the searched node (field_type)
- h: pointer to the height (int*)
Return (pTree): pointer to the Tree structure (pTree)
*/
pTree avlDelete(pTree t, field_type v, int* h){
    pTree tmp;
    if(isEmpty(t)){
        *h = 1;
        return t;
    }   
    else if(t->elmt < v){ // traversal to find the node
        t->rc = avlDelete(t->rc, v, h);
    }
    else if(t->elmt > v){
        t->rc = avlDelete(t->rc, v, h);
        *h = -*h;
    }
    else if(existsRightChild(t)){ // If there is a right child
        t->rc = avlMinDelete(t->rc, h, &(t->elmt)); // Find minimum inside it
    }
    else 
    {
        tmp = t; // the node has only one left or no child
        t = t->lc; // substitute with the left child and delete
        free(tmp); 
        *h = -1;
    }
    if(isEmpty(t)){
        *h = 0;
        t = balanceAVL(t);
    }
    if(*h != 0){
        t->balance = t->balance + *h;
        if(t->balance == 0){
            *h = 0;
        } 
        else
        {
            *h = 1;
        }
    }
    return t;
}

///////////////////////     Useful functions     ///////////////////////

/*
Function that gives the minimum of two integers
Arguments: 
- a: interger (int) 
- b: integer (int)
Return (int): the minimum
*/
int min(int a, int b){
    return (a < b ? a : b);
}

/*
Function that gives the minimum of three integers
Arguments: 
- a: interger (int) 
- b: integer (int) 
- c: integer (int)
Return (int): the minimum
*/
int minThree(int a, int b, int c){
    return min(min(a,b), c);
}

/*
Function that gives the maximum of two integers
Arguments: 
- a: interger (int) 
- b: integer (int)
Return (int): the maximum
*/
int max(int a, int b){
    return (a < b ? b : a);
}

/*
Function that gives the maximum of three integers
Arguments: 
- a: interger (int) 
- b: integer (int)
- c: integer (int)
Return (int): the maximum
*/
int maxThree(int a, int b, int c){
    return max(max(a,b), c);
}

///////////////////////     Rebalancing     ///////////////////////

/*
Function that left rotates the subtree rooted with t
Arguments: t: pointer to the Tree structure (pTree)
Return (pTree): pointer to the left rotated Tree 
*/
pTree leftRotation(pTree t){
    pTree fulcrum = t->rc;
    t->rc = fulcrum->lc;
    fulcrum->lc = t;
    int tBalance = t->balance;
    int fBalance = fulcrum->balance;
    t->balance = tBalance - max(fBalance, 0) - 1; 
    fulcrum->balance = minThree(tBalance - 2, tBalance + fBalance - 2, fBalance - 1);
    t = fulcrum;
    return t;
}

/*
Function that right rotates the subtree rooted with t
Arguments: t: pointer to the Tree structure (pTree)
Return (pTree): pointer to the right rotated Tree 
*/
pTree rightRotation(pTree t){
    pTree fulcrum = t->lc;
    t->lc = fulcrum->rc;
    fulcrum->rc = t;
    int tBalance = t->balance;
    int fBalance = fulcrum->balance;
    t->balance = tBalance - min(fBalance, 0) + 1; 
    fulcrum->balance = maxThree(tBalance + 2, tBalance + fBalance + 2, fBalance + 1);
    t = fulcrum;
    return t;
}

/*
Function that double left rotates the subtree rooted with t
Arguments: t: pointer to the Tree structure (pTree)
Return (pTree): pointer to the double left rotated Tree 
*/
pTree doubleLeftRotation(pTree t){
    t->rc = rightRotation(t->rc); 
    return leftRotation(t);
}

/*
Function that double right rotates the subtree rooted with t
Arguments: t: pointer to the Tree structure (pTree)
Return (pTree): pointer to the double right rotated Tree 
*/
pTree doubleRightRotation(pTree t){
    t->lc = leftRotation(t->lc); 
    return rightRotation(t);
}

/*
Function that ensures the balancing of an AVL after the insertion of an element 
Arguments: t: pointer to the Tree structure (pTree)
Return (pTree): pointer to the balanced Tree 
*/
pTree balanceAVL(pTree t){
    if(t->balance >= 2){ // Deeper right subtree
        if(t->rc->balance >= 0){
            return leftRotation(t);
        }
        else
        {
            return doubleLeftRotation(t);
        }
    }
    else if(t->balance <= -2){ // Deeper left subtree
        if(t->lc->balance <= 0){
            return rightRotation(t);
        }
        else 
        {
            return doubleRightRotation(t);
        }
    }
    return t;
}
