# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include <string.h>
# include "csort.h"
# include "binary_tree.h"
# include "linked_list.h"

///////////////////////     Creation     ///////////////////////

/* 
Function that creates a pointer to the Node structure
Arguments: f: pointer to the field structure representing the node (pField)
Return (pNode): a pointer to the Node structure
*/
pNode createNode(pField f){
    pNode n = malloc(sizeof(Node));
    
    if(n == NULL){
        errorMessage();
    }
    n->next = NULL;
    n->elmt = f[keycolumn].value;
    n->fields = f;

    initStats (f);

    return n;
}

///////////////////////     Insertion     ///////////////////////

/* 
Function that inserts a node in the beginning of a linked list
Arguments: 
- n: pointer to the Node structure (pNode) 
- f: pointer to the field structure representing the node (pField)
Return (pNode): a pointer to the Node structure
*/
pNode insertFirst(pNode n, pField f){
    pNode new = createNode(f);
    new->next = n;
    return new;
}

/* 
Function that inserts a node after a passed pNode
Arguments: 
- n: pointer to the Node structure (pNode) 
- f: pointer to the field structure representing the node (pField)
Return (pNode): a pointer to the Node structure
*/
pNode insertAfter(pNode n, pField f){
    pNode new = createNode(f);
    new->next = n->next;
    n->next = new;
    return n;
}

/* 
Function that compares two elements taking in consideration the sorting direction
Arguments: 
- a: first element  
- b: second element
Return (int): if increasing sorting returns (a-b) else (b-a)
*/

int compare (field_type a, field_type b)    // to consider the reverse sorting : sorting 1 or -1
{
    return (a-b)*sorting;
}

/* 
Function that inserts a node with a certain value in a crescent order
Arguments: 
- n: pointer to the Node structure (pNode) 
- f: pointer to the field structure representing the node (pField)
Return (pNode): a pointer to the Node structure
*/

pNode addNode(pNode n, pField f)
{
    field_type value=f[keycolumn].value;
    pNode p = n, prev;
     
    if(p == NULL){
        p = createNode(f);
        return p;
    } 
    while ((p->next != NULL) && compare (value , p->next->elmt)>=0){    // find the first elmt higher or equal to me
        prev=p;
        p=p->next;
    }
    if (p==NULL){    // we are at the end of the List and higher than all nodes. we just insert at the end
        p = insertAfter(prev,f);
        return n;
    }
    if (compare(value, p->elmt)>0){
        p = insertAfter(p,f);
        return n;
    }
    if (compare(value , p->elmt)<0){
        p = insertFirst(p,f);
        return p;
    } 
    
    // means value is equal to an existing node
    // we need to update this node

    updateStats(p->fields, f);

    return n;
}

///////////////////////     Deletion     ///////////////////////

/* 
Procedure that deletes all the elements of a linked list
Arguments: n: pointer to the Node structure (pNode)
*/
void deleteList(pNode n){
    pNode p;
    
    while(n->next != NULL){
        p = n->next;
        n->next = p->next; 
        free(p);
    }
    free(n);
}


///////////////////////     Printing     ///////////////////////

/* 
Procedure that prints all the values of a linked list
Arguments: n: pointer to the Node structure (pNode)
*/
void printList(pNode n){
    while (n !=NULL)
    {
        show (n->fields);
        n = n->next;
    }
}
