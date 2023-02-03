#ifndef _BINARYTREE_
#define _BINARYTREE_

/* 
Macro that checks if the node of a binary Tree is empty
Arguments: t: pointer to the Tree structure (pTree)
Return (int): 1 if a is empty, 0 if not 
*/
#define isEmpty(t) (t==NULL)

//- Structures and Types -//

/* 
Tree structure
elmt (field_type) : value of a node in the tree
fields (field*) : field which represents the node
lc : pointer to left child 
rc : pointer to right child
*/
typedef struct tree{
    field_type  elmt;
    field       *fields; 
    int         balance;
    struct tree *lc;
    struct tree *rc;
} Tree;

// Definition of the pointer to Tree structure type
typedef Tree* pTree;

extern pTree  pRoot;

// Definition of the pointer to the field type
typedef field* pField;

//- Functions -//

// Creation

pTree createTree(pField);

// Checking

void errorMessage();
int existsLeftChild(pTree);
int existsRightChild(pTree);

// Deletion 

void deleteTree(pTree);

// Trasversals 

void show(pField);
void updateStats(pField, pField);
void initStats(pField);
void infixTraversal(pTree);

#endif