#ifndef _LIST_
#define _LIST_

//- Structures and Types -//

/* 
Node structure
elmt (int) : value of the node
next : pointer to the next node
tree : pointer to the associated tree
*/
typedef struct node {
    field_type elmt;
    field      *fields;
    struct node *next;
} Node;

// Definition of the pointer to Node structure type
typedef Node* pNode;

extern pNode pHead;

//- Functions -//

// Creation

pNode createNode(pField);

// Insertion

pNode insertEnd(pNode, pField);
pNode insertFirst(pNode, pField);
pNode insertAfter(pNode, pField);
pNode addNode(pNode, pField);

// Deletion 

void deleteList(pNode);

// Printing

void printList(pNode);

#endif

