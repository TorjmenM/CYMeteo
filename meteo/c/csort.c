#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <inttypes.h>
#include <string.h>
#include "csort.h"
#include "binary_tree.h"
#include "bst.h"
#include "avl.h"
#include "linked_list.h"
#include "README.csort"

int debug=0;

/* we are setting global variables to optimize time and memory
1- keycolumn is the column number in fields that represents the key column : sort will use this column as index
2- statcolumn[2] an array containing the columns used for statistics. 
3- nbstatcolumns : 0, 1 or 2 
4- flagstats : used to indicate what stats we need MAX:1 MIN:2 AVG:3
5- fieldcnt : number of columns in fields[] 
*/
int   keycolumn=-1;
int   statcolumn[2]={-1,-1};
int   nbstatcolumns=0;
int   flagstats=0;
int   fieldcnt=0;
int   sorting=1;
int   nbstats;
int   col_max = -1; 
int   col_min = -1; 
int   col_sum = -1; 
int   col_cnt = -1; 
int   keylength = 0;
char  field_separator=';';
    
pTree pRoot = NULL;
pNode pHead = NULL;

FILE  *outfile = NULL;

kvstruct lookuptable[] = {
    { "avl", AVL }, { "abr", ABR }, { "tab", TAB }, { "help", HELP }, { "version", VERSION } 
};

//////////////////////////////////////     start lookup table   //////////////////////////////////////

int keyfromstring(char *key)
{
    int i;
    for (i=0; i < NKEYS; i++) {
        #ifdef DEBUG 
        if (debug) printf("table [%d] : [%s] ?= key[%s]\n",i,(lookuptable[i]).key,key); 
        #endif
        if (strcmp((lookuptable[i]).key, key) == 0)
            return (lookuptable[i]).val;
    }
    return BADKEY;
}       

///////////////////////////// Start of generic function for allocation, usage and errors  /////////////////////////

void
usage (int status)
{
  if (status != EXIT_SUCCESS)
    fprintf (stderr, "Try `%s --help' for more information.\n", PROGRAM_NAME);
  else
  {
      fprintf(stdout, README);
  }
  exit (status);
}

void
error (int mode, char * message, char *opts)
{
  fprintf((mode)?stdout:stderr, message, opts);
  if (mode!=EXIT_SUCCESS) exit (mode);
}

void *
xmalloc (size_t size)
{
  void *new_mem = (void *) malloc (size);
  if (new_mem == NULL)    
    {
      fprintf (stderr, "fatal: memory exhausted (xmalloc of %.ld bytes).\n", size);
      exit (-1);
    }
  return (new_mem);
}

void *
xmemdup (const void *input, size_t alloc_size)
{
  void *output = xmalloc (alloc_size);
  memset (output, 0, alloc_size);
  memcpy (output, input, alloc_size);
  return (output);
}

void 
xmemfree (void *var)
{
  if (var != NULL) free (var);
}

char *
strdup(const char *input)
{
  return (xmemdup(input, strlen(input)+1));
}

//////////////////////////////// Start of linked list to store fields arrays for freeing /////////////////////////

int isneeded (int what, int stat ){
  return ((what & stat) && what);
}

int getcolstats(int what, int stat) {
    int retval=0;
    switch (what) {
      case AVG : if (isneeded (AVG, stat)) retval+=1;  else break;
      case MIN : if (isneeded (MIN,stat)) retval+=1;  else break;
      case MAX : if (isneeded (MAX, stat)) retval+=1;  
        break;
      default : return -1;
    }
    return (retval-1);
}

void push(stack **p, void *val)
{
  stack *element = malloc(sizeof(stack));
  if(!element) exit(OTHER_ERROR);     /* Si l'allocation a échoué. */
  element->value = val;
  element->prec = *p;
  *p = element;       /* Le pointeur pointe sur le dernier élément. */
}
void clear(stack **p)
{
  stack *tmp;
  while(*p)
  {
    tmp = (*p)->prec;
    xmemfree(*p);
    *p = tmp;
  }
}
void scan(stack *p, int cnt, void fct(void *))
{
  while(p != NULL)
  {
    int i;

    field *f=(field *)(p->value); 
    for (i=0; i<=cnt; i++)
      if ((i==statcolumn[0]) || (i==statcolumn[1]))
        if (f[i].stat!=NULL)
          (*fct)(f[i].stat);
    
    (*fct)(p->value);
    p = p->prec;
  }
}

//////////////////////////////////////////   Start keyfield section /////////////////////////////////
struct keyfield *
key_init (struct keyfield *key)
{
  memset (key, 0, sizeof *key);
  key->value = -1;
  key->next = NULL;
  return key;
}

/* Insert a malloc'd copy of key KEY_ARG at the end of the key list.  */
void
insertkey (struct keyfield *key_arg, struct keyfield *keylist)
{
  struct keyfield **p;
  struct keyfield *key = xmemdup (key_arg, sizeof *key);

  for (p = &keylist; *p; p = &(*p)->next)
    continue;
  *p = key;
  key->next = NULL;
}

int
searchkey (int num, struct keyfield *keylist)
{
  struct keyfield **p;
  
  for (p = &keylist; *p; p = &(*p)->next) { if (num == (*p)->value) return num; }
  return (-1);
}

void
freekeylist (struct keyfield * keylist) {
  struct keyfield * tmp;
  while (keylist != NULL)
  {
    tmp=keylist;
    keylist=keylist->next;
    xmemfree(tmp);
  }
}

void 
keydump (struct keyfield * keylist) {
  struct keyfield **p;
  printf("list dump: ");
  for (p = &keylist; *p; p = &(*p)->next) {
    printf ("%ld,",(*p)->value);
    continue;
  }
  printf("\n");
}
          
// parse the optarg after -k and -g to create a list of columns for sorting and 
// a list for grouping 
char  *
parse_optarg (char const *string, int *val)
{
  char *suffix;
  int n;

  n=strtol (string, &suffix, 10);
  *val = n;
    
  #ifdef DEBUG 
  if (debug) printf ("strtoul: [%ld] - suffix is [%s]\n", n, suffix ); 
  #endif 
  return suffix;
}

//////////////////////////////////////   end of lookup table  ///////////////////////////////////////////


// returns number of fields in the record
int getfieldcount( char *record, char delim)
{
  char  sep[2]; sprintf(sep,"%c",delim);
  char  *p = strdup(record);
  char  *tok;
  int   fld=0;
       
  while ((tok = strsep(&p, sep)) != NULL) 
  {
    if (fld==keycolumn) {
      keylength=strlen(tok);
      #ifdef DEBUG
      if (debug) printf(" Key length is [%d]\n", keylength);
      #endif
    }
    fld++;
  }
  xmemfree(p);		
	return fld;
}

void parserecord ( char *record, char delim, field *fields ,int *fldcnt)
{
  char  sep[2]; sprintf(sep,"%c",delim);
  char  *p = strdup(record);
  char  *tok;
  int   fld=0;
       
  while ((tok = strsep(&p, sep)) != NULL) 
  {
    fields[fld].value=atof(*tok ? tok : "");  // assumng all values in ifile are numeric
    fields[fld].stat=NULL;
    #ifdef DEBUG 
    if (debug) printf("field[%d]=%f\n",fld,fields[fld].value); 
    #endif
    fld++;
  }
  xmemfree(p);		
	*fldcnt=fld;
}

// Set all global external variables to share with all the modules 

void prepcontext(keyfield *keylist, keyfield *grplist) {
  col_max = getcolstats(MAX,flagstats);
  col_min = getcolstats(MIN,flagstats);
  col_sum = getcolstats(AVG,flagstats);
  col_cnt = col_sum+1;

  // Limitation for simplier implementation : we will assume only one column to be key
  // the other keys will be ignored
  keycolumn=(keylist->value-1);

  statcolumn[0]=((grplist->value > 0)?(grplist->value-1):-1);
  statcolumn[1]=(((grplist->next) && (grplist->next->value >0))?(grplist->next->value-1):-1);

  nbstatcolumns=0;
  if (statcolumn[0]>=0) nbstatcolumns++;
  if (statcolumn[1]>=0) nbstatcolumns++;

  nbstats=0;  // to get how many double to allocate
  if (isneeded(MAX,flagstats)) nbstats++;
  if (isneeded(MIN,flagstats)) nbstats++;
  if (isneeded(AVG,flagstats)) nbstats+=2;

  #ifdef DEBUG
  // dumping all gloal variables
  if (debug) {
    printf("-----------------------------------------------\n");
    printf("Key Column is [%d]\n", keycolumn);
    printf("Nb Stat Columns is [%d]\n", nbstatcolumns);
    printf("Stat Columns are [%d] [%d]\n", statcolumn[0], statcolumn[1]);
    printf("flag stats is [%d]\n", flagstats);
    printf("fields count is [%d] \n", fieldcnt);
    printf("Nb stat values is [%d] \n", nbstats);
    printf("cmax: %d cmin: %d csum:%d ccnt:%d\n",col_max,col_min,col_sum,col_cnt);
    printf("-----------------------------------------------\n");
  }
  #endif
}

int 
sort (int sort_method, char * ifile, char * ofile)
{
  char        record[ MAXFIELDS*MAXFIELDSIZE];
	int         recordcnt=0;
  struct      field *fields;
  pTree       pabrTree,pavlTree; 
  pNode       ptabList;     

  struct  stack *mystack = NULL;   /* Impératif de l'initialiser à NULL */
  
  // Open the input file - check errors type 2 
  FILE *infile=fopen(ifile,"r");
 
	if (infile==NULL) {
		error(INPUT_FILE_ERROR,"error opening input file : %s\n",ifile);
  }
  // open or create the output file - check errors type 3
  outfile=fopen(ofile,"w");

	if (outfile==NULL) {
		error(OUTPUT_FILE_ERROR,"error opening output file : %s\n",ofile);
  }

  // loop on file records
  while(fgets(record,sizeof(record),infile)!=0) /* read a record */
	{
    int  i=0;
    int  _fieldcnt=0;
    
    #ifdef DEBUG 
    if (debug) printf("record before parsing : %s \n", record); 
	  #endif
    recordcnt++;
    
    // get first line fields count as a reference
   
    if (fieldcnt==0) {
      fieldcnt=getfieldcount (record, field_separator);
  
      #ifdef DEBUG 
      if (debug) printf("line %d - fields count : %d - %s\n",recordcnt,fieldcnt, record); 
	    #endif
    }
    
    // create an array of fieldcnt fields 
    // allocating memory for an array of fieldcnt fields
    fields=xmalloc (fieldcnt*sizeof (*fields));

    /* parse line using field separator and get fields count */
    parserecord(record,field_separator,fields,&_fieldcnt);    /* whack record into fields */
    
    if (fieldcnt==0) {
      xmemfree(fields);
      error(OTHER_ERROR,"no fields or invalid field separator \n","");
    }

    if (_fieldcnt != fieldcnt) {
      xmemfree(fields);
      error(OTHER_ERROR,"inconsistency in number of fields \n","");
    }
    
    for(i=0;i<fieldcnt;i++)
    { /* print each field */
       if ((i==statcolumn[0]) || (i==statcolumn[1]))
        fields[i].stat=xmalloc (sizeof(double)*nbstats);
      else 
        fields[i].stat=NULL;
    }
    
    push(&mystack, fields);  // add fields to my stack  

    // if the field is a g field then we need to alloc the stats
    switch (sort_method) {
      case AVL : // call avl insert
        if (recordcnt==1) {
          pRoot = createTree(fields);
          pavlTree = pRoot;
        } else {
          int depth = 1;
          pavlTree = avlInsertion(pavlTree, fields, &depth);
        }
        break;
      case ABR : // call abr insert
        if (recordcnt==1) {
          pRoot = createTree(fields);
          pabrTree = pRoot;
        } else {
          pabrTree = bstInsertion( pabrTree, fields );
        }
        break;
      case TAB : // call tab insert
        if (recordcnt==1) {
          pHead = createNode(fields);
        } else {
          ptabList = addNode(pHead, fields);
          if (ptabList != pHead) {
            printf("HEAD Change from %g to %g \n", pHead->elmt, ptabList->elmt);
            pHead=ptabList;
          }
        }
        break;
      default :
        break;
    }
  }  
  
  // now we call for sorting
  switch (sort_method) {
    case AVL : 
    case ABR :
      infixTraversal(pRoot);
      deleteTree(pRoot);
      break;
    case TAB : 
      printList(pHead);
      deleteList(pHead);
      break;
  }

  fclose(infile);
  fclose(outfile);

  scan(mystack, fieldcnt,  xmemfree);
  clear(&mystack);

  return EXIT_SUCCESS;
}

int 
main(int argc, char *argv[ ])
{
    struct keyfield   *key, *p;
    struct keyfield   key_buf;
    struct keyfield   grp_buf;
    int               option;
    char              *ifile=NULL;
    char              *ofile=NULL;
    int               sort_method=1; // default sorting method is AVL. {1:avl, 2:abr, 3:tab}
    char              *s;
    extern int        optind, optopt;
    extern char       *optarg;   
    int               retval=-1;   
    
    //default sort method is AVL
    sort_method=AVL;
    key_init (&key_buf);
    key_init (&grp_buf);
    while ((option = getopt(argc, argv, ":f:o:rd-:k:s:g:t:")) != -1) {
        switch(option) {
        case 'd':
          debug=1;
          #ifdef DEBUG 
          if (debug) printf ("debug mode \n"); 
		      #endif
          break;
        case 's':
          flagstats = atoi(optarg);
          #ifdef DEBUG 
          if (debug) printf ("flag statsitics is [%d]\n",flagstats); 
		      #endif
          break;
        case 'r':
          sorting=-1;
          #ifdef DEBUG 
          if (debug) printf ("reverse sorting is [%d]\n",sorting); 
		      #endif
          break;
        case 't':
          field_separator = optarg[0];
          #ifdef DEBUG 
          if (debug) printf ("field_separator is [%c]\n",field_separator); 
		      #endif
          break;
        case 'f':
          ifile =strdup (optarg);
          #ifdef DEBUG 
          if (debug) printf ("input files is [%s]\n",ifile); 
		      #endif 
          break; 
        case 'o':
          ofile = strdup (optarg);
          #ifdef DEBUG 
          if (debug) printf ("output files is [%s]\n",ofile); 
		      #endif
          break;
        case 'k':
        case 'g':
          p=(option=='k'?&key_buf:&grp_buf);
          key = key_init (p);
          #ifdef DEBUG 
          if (debug) printf("case 'k' > optarg : [%s]\n",optarg); 
		      #endif 
          s = parse_optarg (optarg, &key->value);
          while  (*s) {
              insertkey (key,p);
              key=key->next;
              s = parse_optarg (s+1, &key->value);
          } 
          #ifdef DEBUG 
          if (debug) keydump (p); 
		      #endif
          break;
        case '-': 
          switch(retval=keyfromstring(optarg)) {
            case HELP:
              usage (EXIT_SUCCESS);
              break;
            case VERSION:
					    // display version number
					    printf ("version is %s\n", PVERSION );
              break;
            case AVL:
            case ABR:
            case TAB:
              sort_method=retval;
              #ifdef DEBUG
              if (debug) printf ("sort method is [%s]\n",optarg);
              #endif
              break;
            default:
              usage (SORT_FAILURE);
              break;
          }
          break;
        default:
          usage (SORT_FAILURE);
          break;
        case '?':
            fprintf(stderr, "Unrecognized option: -%c\n", optopt);
            usage (SORT_FAILURE);
      }
    }
    // check mandatory options
    if (ifile==NULL || ofile==NULL) 
    {
      error (EXIT_SUCCESS, "-o and -f are mandatory options\n", optarg);
      usage(SORT_FAILURE);
    }

    // Prepare all global variables 
    // Call prepcontext

    prepcontext(&key_buf,&grp_buf);

    
    //////////////////////////////////////////////////////// ALl OK to call sort /////////////////////////////////////////////

    retval = sort (sort_method,ifile,ofile);

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    xmemfree (ifile);
    xmemfree (ofile);
    freekeylist (key_buf.next);
    freekeylist (grp_buf.next);
    
    return  (retval)?retval:EXIT_SUCCESS;
    // O: No errors - 1: Args errors - 2: ifile issue 3: ofile issue 4: any other issue
}
