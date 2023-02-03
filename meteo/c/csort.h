#ifndef _CSORT_
#define _CSORT_


/* The official name of this program  */
#define PROGRAM_NAME "csort"
#define DEBUG 

enum {
  SORT_FAILURE      = 1,
  INPUT_FILE_ERROR  = 2,
  OUTPUT_FILE_ERROR = 3,
  OTHER_ERROR       = 4
};

#define AUTHORS \
  proper_name ("Mehdi Torjmen"), \
  proper_name ("Moutie Zahrez")

#define PVERSION "1.0.1"

//- Structures and Types -//

typedef double field_type;

enum { MAX=1, MIN=2, AVG=4};

typedef struct field
{
    field_type  value;
    field_type  *stat;
} field;

typedef struct keyfield
{
  int value;
  struct keyfield *next;	/* Next keyfield to try. */
} keyfield;

typedef struct stack
{
  void          *value;
  struct stack  *prec;	
} stack;

/* The guessed size for non-regular files.  */
#define INPUT_FILE_SIZE_GUESS (1024 * 1024)

// create a lookup table to convert long optargs into integers for the switch

#define BADKEY -1
#define AVL 1
#define ABR 2
#define TAB 3
#define HELP 4
#define VERSION 5

typedef struct { char *key; int val; } kvstruct;

#define NKEYS (sizeof(lookuptable)/sizeof(kvstruct))

/* reading csv file and parsing lines and creating an array of fields
   the routine controls if the file is corrupted by checking if all is 
   numeric and tha the number of fields is correct */

#define MAXFIELDS 10       /* maximum possible number of fields */
#define MAXFIELDSIZE 30    /* longest possible field + 1 = 31 byte field */

//- Functions -//

int         keyfromstring(char *);
void        usage (int );
void        error (int , char * , char *);
void *      xmalloc (size_t);
void *      xmemdup (const void *, size_t );
void        xmemfree (void *);
char *      strdup (const char *);
int         isneeded (int, int );
int         getcolstats (int , int );
void        push (stack **, void *);
void        clear (stack **);
void        scan (stack *, int, void fct(void *));
keyfield *  key_init (struct keyfield *);
void        insertkey (struct keyfield *, struct keyfield *);
int         searchkey (int, struct keyfield *);
void        freekeylist (struct keyfield *);
void        keydump (struct keyfield *);
char *      parse_optarg (char const *, int *);
int         getfieldcount( char *, char);
void        parserecord ( char *, char , field * ,int *);
void        prepcontext (keyfield *, keyfield *);
int         sort (int, char *, char *);

//- Global variables -//

extern int  keycolumn;
extern int  statcolumn[2];
extern int  nbstatcolumns;
extern int  flagstats;
extern int  fieldcnt;
extern int  sorting;
extern int  nbstats;
extern int  col_max; 
extern int  col_min; 
extern int  col_sum; 
extern int  col_cnt; 
extern FILE *outfile;
extern int  keylength;
extern char field_separator;

#endif
