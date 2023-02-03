# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include <string.h>
# include "csort.h"
# include "binary_tree.h"

///////////////////////     Creation     ///////////////////////

/* 
Function that creates a new node of a Tree
Arguments: f: pointer to the field structure representing the node (pField)
Return (pTree) : pointer to the Tree structure 
*/
pTree createTree(pField f){
    pTree t = xmalloc(sizeof(*t));
    // memset (t,'\0', sizeof(*t));
    
    t->elmt = f[keycolumn].value;
    t->fields = f;
    t->balance = 0;
    t->lc = NULL;
    t->rc = NULL;

    for (int i = 0 ; i < nbstatcolumns ; i++){
        field_type *stats= f[statcolumn[i]].stat;
        field_type value = f[statcolumn[i]].value;
        if (isneeded (MAX, flagstats) && (col_max>=0)) stats[col_max] = value; 
        if (isneeded (MIN, flagstats) && (col_min>=0)) stats[col_min] = value;
        if (isneeded (AVG, flagstats) && (col_sum>=0)) { stats[col_sum] = value;  stats[col_cnt] = 1; }
    }
    return t;
}

///////////////////////     Checking     ///////////////////////

/* 
Procedure that prints an error message of an empty node and exits the program
*/
void errorMessage(){
    // Error
    error(OTHER_ERROR,"Error : the node is empty\n","");
    exit(1);
}

/* 
Function that checks if there exists a left child to the node of a binary Tree
Arguments: t: pointer to the Tree structure (pTree)
Return (int): 1 if there exists a left child, 0 if not 
*/
int existsLeftChild(pTree t)
{
    if (isEmpty(t)){
        errorMessage();
    }
    return (t->lc ? 1 : 0);
}

/* 
Function that checks if there exists a right child to the node of a binary Tree
Arguments: t: pointer to the Tree structure (pTree)
Return (int): 1 if there exists a right child, 0 if not 
*/
int existsRightChild(pTree t)
{
    if (isEmpty(t)){
        errorMessage();
    }
    return (t->rc ? 1 : 0);
}

///////////////////////     Deletion     ///////////////////////

/* 
Procedure that removes a whole tree
Arguments: t: pointer to the Tree structure (pTree)
*/
void deleteTree(pTree t){
    if(isEmpty(t)) return; 
    
    // Recursive traversal of the Tree
    deleteTree(t->lc);
    deleteTree(t->rc);
    
    xmemfree (t);
}

///////////////////////     Traversals     ///////////////////////

/* 
Procedure that prints the value of the element of the Tree structure
Arguments: pf: the field of the record to be written in the outpout file
*/
void show(pField pf){
    char  record[MAXFIELDS*MAXFIELDSIZE]="";
    char  buffer[MAXFIELDSIZE];
	
    if (!isEmpty(pf)) {
        
        for (int i = 0; i < fieldcnt; i++) {
            field f = pf[i];
            if (f.stat && ((i==statcolumn[0]) || (i==statcolumn[1]))) {
                field_type *stats=f.stat;
                for (int j = 0 ; j < nbstats ; j++){
                    double avg=stats[j];
                    if ((j==col_sum) && (stats[j+1]!=0)) {
                        avg = stats[j]/stats[j+1];
                        j++;
                    }
                    sprintf(buffer,"%.15g;",avg);
                    strcat(record,buffer);
                }
            } else {
                // we need to pad the key to its original length : keylength
                if (i==keycolumn) {
                    sprintf(buffer,"%0*.15g%c",keylength,f.value,field_separator);
                } else  
                    sprintf(buffer,"%.15g%c",f.value,field_separator);
                strcat(record,buffer);
            }
        }
        record[strlen(record)-1]='\0';  // remove the last field separator
        fprintf(outfile,"%s\n",record);
    }
}

/* 
Procedure that update Stats with a new coming value
Arguments: 
- f: pointer to the field structure (pField) that will be updated
- nf: the field of the new record that will be added to the stats
*/
 void updateStats (pField f, pField nf){
    for (int i = 0 ; i < nbstatcolumns ; i++){
        field_type *stats = f[statcolumn[i]].stat; 
        field_type  value = nf[statcolumn[i]].value;
        if (isneeded (MAX, flagstats) && (col_max>=0) && (value > stats[col_max])) stats[col_max] = value; 
        if (isneeded (MIN, flagstats) && (col_min>=0) && (value < stats[col_min])) stats[col_min] = value;
        if (isneeded (AVG, flagstats) && (col_sum>=0)) { stats[col_sum] += value;  stats[col_cnt] += 1; }   
    }
 }

/* 
Procedure that initialize Stats for a field array
Arguments: f: pointer to the field structure (pField)
*/
void initStats (pField f) {
    for (int i = 0 ; i < nbstatcolumns ; i++){
        field_type *stats= f[statcolumn[i]].stat;
        field_type value = f[statcolumn[i]].value;
        if (isneeded (MAX, flagstats) && (col_max>=0)) stats[col_max] = value; 
        if (isneeded (MIN, flagstats) && (col_min>=0)) stats[col_min] = value;
        if (isneeded (AVG, flagstats) && (col_sum>=0)) { stats[col_sum] = value;  stats[col_cnt] = 1; }
    }
}

#define ELMT(a) ((a==NULL)?-1:a->elmt)
/* 
Procedure that shows the different steps of an infix or anti-infix traversal of a binary Tree
Arguments: t: pointer to the Tree structure (pTree)
*/
void infixTraversal(pTree t) {
    if (!isEmpty(t)) {
        if (sorting==1) {
            infixTraversal( t->lc );
            show(t->fields);
            infixTraversal( t->rc );
        } else {
            infixTraversal( t->rc );
            show(t->fields);
            infixTraversal( t->lc ); 
        }
    }
}

