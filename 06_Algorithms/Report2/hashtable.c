#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct Node {
    int key;
    struct Node *next;
}node;

typedef struct linkedlist {
    struct Node *head;
    int size;
}list;

typedef struct hashtable {
    struct linkedlist **lists;
    int modi;
}hash;

node *initNode(int k) {
    node *n = (node *)malloc(sizeof(node));
    n->key = k;
    n->next = NULL;
    return n;
}

list *initList() {
    list *l = (list *)malloc(sizeof(list));
    l->head = NULL;
    l->size = 0;
    return l;
}

hash *initHash(int m) {
    hash *h = (hash *)malloc(sizeof(hash));
    h->lists = (list **)malloc(m * sizeof(list *));
    h->modi = m;
    for(int i=0; i<m; i++) {
        h->lists[i] = initList();
    }
    return h;
}

int isListEmpty(list *l) {
    return l->size == 0;
}

void addKey(hash *h, int k) {
    int i = k % (h->modi);
    node *n = initNode(k);
    node *cur;
    if(isListEmpty(h->lists[i])) {
        h->lists[i]->head = n;
    }
    else {
        cur = h->lists[i]->head;
        while(cur->next != NULL) {
            cur = cur->next;
        }
        cur->next = n;
    }
    h->lists[i]->size ++;
}

void delete(hash *h, int key) {
    int flag = 0;
    int i = key % (h->modi);
    node *cur = h->lists[i]->head;
    node *prev = cur;
    while(cur != NULL) {
        if(cur->key == key) {
            flag = 1;
            if(prev == cur) {
                h->lists[i]->head = cur->next;
                free(cur);
            }
            else {
                prev->next = cur->next;
                free(cur);
            }
            break;
        }
        else {
            prev = cur;
            cur = cur->next;
        }
    }
    if(!flag) {
        //printf("## CANNOT FIND %d in hash %d\n", key, h->modi);
    }
}

void printHash(hash *h) {
    node *cur;
    for(int i=0; i<h->modi; i++) {
        printf("%d: ", i);
        if(!isListEmpty(h->lists[i])) {
            cur = h->lists[i]->head;
            while(cur != NULL) {
                printf("%d ", cur->key);
                cur = cur->next;
            }
        }
        else {
            printf("Empty");
        }
        printf("\n");
    }
}

int main() {
    int key;
    hash *hash7, *hash11, *hash13;
    hash7 = initHash(7);
    hash11 = initHash(11);
    hash13 = initHash(13);
    srand(time(NULL));
    for(int i=0; i<50; i++) {
        key = rand()%100;
        addKey(hash7, key);
        addKey(hash11, key);
        addKey(hash13, key);
    }
    printf("===== 7 =====\n");
    printHash(hash7);
    printf("===== 11 =====\n");
    printHash(hash11);
    printf("===== 13 =====\n");
    printHash(hash13);
    printf("\n");
    for(int i=1; i<=10; i++) {
        delete(hash7, i);
        delete(hash11, i);
        delete(hash13, i);
    }
    //printf("\n===== Delete Compelete =====\n\n");
    printf("===== 7 =====\n");
    printHash(hash7);
    printf("===== 11 =====\n");
    printHash(hash11);
    printf("===== 13 =====\n");
    printHash(hash13);
}