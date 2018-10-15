#ifndef __HTTP_HANDLER_H__
#define __HTTP_HANDLER_H__
typedef struct REQUEST_LINE {
    char method[100];
    char url[512];
    char version[4096];
} request_line_t;

typedef struct HEADER {
    char fieldName[100];
    char val[1024];
    struct HEADER *next;
} header_line_t;

typedef struct HEADER_LINKEDLIST {
    header_line_t *head;
} header_line_list_t;
#endif
