#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct Node {
    struct Node *left;
    struct Node *right;
    struct Node *p;
    int key;
}node;

typedef struct Tree {
    node *root;
    int size;
}tree;

tree *initTree() {
    tree *t = (tree *)malloc(sizeof(tree));
    t->root = NULL;
    t->size = 0;
    return t;
}

node *initNode(int k) {
    node *n = (node *)malloc(sizeof(node));
    n->left = NULL;
    n->right = NULL;
    n->p = NULL;
    n->key = k;
    return n;
}

int ab(int a) {
    return a<0 ? a*(-1):a;
}

void TREE_INSERT(tree *T, int x) {
    node *cur, *prev=NULL;
    node *z = initNode(x);
    cur = T->root;
    while(cur != NULL) {
        prev = cur;
        if(z->key < cur->key) {
            cur = cur->left;
        }
        else if(z->key > cur->key) {
            cur = cur->right;
        }
        else {
            return;
        }
    }
    if(prev != NULL) {
        z->p = prev;
        if(z->key < prev->key) {
            prev->left = z;
        }
        else {
            prev->right = z;
        }
    }
    else {
        T->root = z;
    }
    T->size ++;
}

node *TREE_SEARCH(tree *T, int z) {
    node *cur = T->root;

    printf("Search(%d) path: ", z);
    while(cur != NULL) {
        printf("%d ", cur->key);
        if(z == cur->key) {
            printf("=> Found!\n");
            return cur;
        }
        else if(z < cur->key) {
            cur = cur->left;
        }
        else {
            cur = cur->right;
        }
    }
    printf("=> Not Found\n");
    return NULL;
}

node *TREE_SEARCH_PRIME(tree *T, int z) {
    node *cur = T->root;
    node *prev;

    printf("Search_P(%d) path: ", z);
    while(cur != NULL) {
        prev = cur;
        printf("%d ", cur->key);
        if(z == cur->key) {
            printf("=> Found. no meaningful\n");
            return cur;
        }
        else if(z < cur->key) {
            cur = cur->left;
        }
        else {
            cur = cur->right;
        }
    }
    printf("=> Not Found. meaninguful\n");
    return prev;
}

node *Successor(node *z) {
    node *prev;
    if(z->right != NULL) {
        z = z->right;
        while(z->left != NULL) {
            z = z->left;
        }
        return z;
    }
    else {
        prev = z->p;
        while(prev != NULL && z==prev->right) {
            z = prev;
            prev = prev->p;
        }
        return prev;
    }
}

node *Precessor(node *z) {
    node *prev;
    if(z->left != NULL) {
        z = z->left;
        while(z->right != NULL) {
            z = z->right;
        }
        return z;
    }
    else {
        prev = z->p;
        while(prev != NULL && z==prev->left) {
            z = prev;
            prev= prev->p;
        }
        return prev;
    }
}

node *NEAREST_NEIGHBOR(tree *T, int k) {
    int min;
    node *succ, *prec, *nearest;
    printf("NEAREST of %d\n", k);
    node *n = TREE_SEARCH_PRIME(T, k);
    succ = Successor(n);
    prec = Precessor(n);
    if(n->key != k && succ != NULL && prec != NULL) {
        printf("search': %d\tsucc: %d\tprec: %d", n->key, succ->key, prec->key);
        nearest = ab((n->key)-k)<ab((succ->key)-k) ? n:succ;
        min = ab((n->key)-k)<ab((succ->key)-k) ? ab((n->key)-k):ab((succ->key)-k);
        nearest = min<ab((prec->key)-k) ? nearest:prec;
    }
    else if(succ != NULL && prec != NULL) {
        printf("search': no meaning  succ: %d\tprec: %d", succ->key, prec->key);
        nearest = ab((succ->key)-k)<ab((prec->key)-k) ? succ:prec;
    }
    else if(n->key!=k && succ==NULL) {
        printf("search': %d\tsucc: NULL\tprec: %d", n->key, prec->key);
        nearest = ab((n->key)-k)<ab((prec->key)-k) ? n:prec;
    }
    else {
        printf("search': %d\tsucc: %d\tprec: NULL", n->key, succ->key);
        nearest = ab((n->key)-k)<ab((succ->key)-k) ? n:succ;
    }
    printf("\t=> nearest: %d\n\n", nearest->key);
    
    return nearest;
}

void TREE_DELETE(tree *T, int tar) {
    node *x, *y;
    node *z = TREE_SEARCH(T, tar);
    if(z != NULL) {
        if(z->left==NULL || z->right==NULL) {
            y = z;
        }
        else {
            y = Successor(z);
        }
        if(y->left != NULL) {
            x = y->left;
        }
        else {
            x = y->right;
        }
        if(x != NULL) {
            x->p = y->p;
        }
        if(y->p == NULL) {
            T->root = x;
        }
        else if(y==y->p->left) {
            y->p->left = x;
        }
        else {
            y->p->right = x;
        }
        if(y != z) {
            z->key = y->key;
        }
    }
}

int Height(node *n) {
    int r=0, l=0;
    if (n->right != NULL)
        r = Height(n->right) + 1;
    if (n->left != NULL)
        l = Height(n->left) + 1;
    return 1 + (r>l ? r:l);
}

int print(node *n, int isLeft, int offset, int depth, char treeStr[20][255]) {
    char b[5];
    int width=3;

    if (n == NULL) {
        return 0;
    }

    sprintf(b, "%03d", n->key);

    int left = print(n->left, 1, offset, depth+1, treeStr);
    int right = print(n->right, 0, offset+left+width, depth+1, treeStr);

    for(int i=0; i<width; i++) {
        treeStr[2*depth][offset+left+i] = b[i];
    }

    if(depth>0 && isLeft) {
        for(int i=0; i<width+right; i++) {
            treeStr[2*depth-1][offset+left+width/2+i] = '-';
        }

        treeStr[2*depth-1][offset+left+width/2] = '+';
        treeStr[2*depth-1][offset+left+width+right+width/2] = '+';

    } 
    else if(depth>0 && !isLeft) {
        for(int i=0; i<left+width; i++) {
            treeStr[2*depth-1][offset-width/2+i] = '-';
        }
        treeStr[2*depth-1][offset+left+width/2] = '+';
        treeStr[2*depth-1][offset-width/2-1] = '+';
    }

    return left + width + right;
}

void PRINT_BST(tree *t) {
    char treeStr[20][255];
    int height;
    node *root = t->root;
    for(int i = 0; i < 20; i++){
        sprintf(treeStr[i], "%150s", " ");
    }

    print(root, 0, 0, 0, treeStr);
    height = Height(root);

    for(int i=0; i<height; i++)
        printf("%s\n", treeStr[i]);
    printf("\n");
}

int main() {
    int A[20], size;
    tree *BST = initTree();
    srand(time(NULL));
    for(int i=0; i<20; i++) {
        A[i] = rand()%50;
    }
    for(int i=0; i<20; i++) {
        TREE_INSERT(BST, A[i]);
    }
    PRINT_BST(BST);

    TREE_SEARCH(BST, 15);
    TREE_SEARCH(BST, 8);
    TREE_SEARCH(BST, 18);
    printf("\n");

    NEAREST_NEIGHBOR(BST, 17);
    NEAREST_NEIGHBOR(BST, 3);
    NEAREST_NEIGHBOR(BST, 8);

    printf("## Insert 5\n");
    size = BST->size;
    TREE_INSERT(BST, 5);
    if(size != BST->size){
        PRINT_BST(BST);
        size = BST->size;
    }
    printf("## Insert 7\n");
    TREE_INSERT(BST, 7);
    if(size != BST->size){
        PRINT_BST(BST);
        size = BST->size;
    }
    printf("## Insert 17\n");
    TREE_INSERT(BST, 17);
    if(size != BST->size){
        PRINT_BST(BST);
        size = BST->size;
    }
    printf("## Insert 51\n");
    TREE_INSERT(BST, 51);
    if(size != BST->size){
        PRINT_BST(BST);
        size = BST->size;
    }

    printf("## Delete 17\n");
    TREE_DELETE(BST, 17);
    PRINT_BST(BST);
    printf("## Delete 5\n");
    TREE_DELETE(BST, 5);
    PRINT_BST(BST);
    printf("## Delete 51\n");
    TREE_DELETE(BST, 51);
    PRINT_BST(BST);
    printf("## Delete 17\n");
    TREE_DELETE(BST, 17);
    PRINT_BST(BST);
    return 0;
}
