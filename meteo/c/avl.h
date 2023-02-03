#ifndef _AVL_
#define _AVL_

//- Functions -//

// Insertion 

pTree avlInsertion(pTree, pField, int*);

// Deletion

pTree avlMinDelete(pTree, int*, field_type*);
pTree avlDelete(pTree, field_type, int*);

// Useful functions

int min(int, int);
int minThree(int , int, int);
int max(int, int);
int maxThree(int, int, int);

// Rebalancing

pTree leftRotation(pTree);
pTree rightRotation(pTree);
pTree doubleLeftRotation(pTree);
pTree doubleRightRotation(pTree);
pTree balanceAVL(pTree);

#endif