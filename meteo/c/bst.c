# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include <string.h>
# include "csort.h"
# include "binary_tree.h"
# include "bst.h"


///////////////////////     Searching     ///////////////////////

/* 
Function that search a node with a certain element in a binary search Tree 
Arguments: 
- t: pointer to the Tree structure (pTree) 
- v: element of the searched node (field_type)
Return (int): 1 if the node is found, 0 if not
*/
int search(pTree t, field_type v){
    if(isEmpty(t)){
        return 0; // Not found
    } 
    if(t->elmt == v){
        return 1; // Found
    }
    else if(t->elmt > v){
        search(t->lc, v);
    } 
    else
    {
        search(t->rc, v);
    }
    return 0;
}

///////////////////////     Insertion     ///////////////////////

/* 
Function that inserts a node with a certain element in a binary search Tree
Arguments: 
- t: pointer to the Tree structure (pTree) 
- f: pointer to the field representing the added node (pField)
Return (pTree): pointer to the Tree structure of the inserted node (pTree)
*/
pTree bstInsertion(pTree t, pField f){
    field_type v=f[keycolumn].value;

    if(isEmpty(t)){
        return createTree(f);
    }
    else if(t->elmt > v){
        t->lc = bstInsertion(t->lc, f);
    }
    else if(t-> elmt < v){
        t->rc = bstInsertion(t->rc, f);
    } else if(t-> elmt == v){
        // case of equal key : we need to process stats if asked by the user
        updateStats(t->fields, f);
    }
    return t;
}

///////////////////////     Deletion     ///////////////////////

/* 
Function that removes the node with the maximum value from a binary search tree
Arguments: 
- t: pointer to the Tree structure (pTree)
- pelmt: pointer to the element of the Tree structure (field_type*)
Return (pTree): pointer to the Tree structure (pTree)
*/
pTree deleteMax(pTree t, field_type *pelmt){
    pTree tmp;
    if(existsRightChild(t)){
        t->rc = deleteMax(t->rc, pelmt); // Recusrive call for the right child
    }
    // if not right child anymore, we have the successor
    else 
    {
        *pelmt = t->elmt;
        tmp = t;
        t = t->lc;
        free(tmp); 
    }
    return t;
}

