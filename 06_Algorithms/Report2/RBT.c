#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct Node {
    struct Node *left;
    struct Node *right;
    struct Node *p;
    int key;
    int isRed;
}node;

typedef struct Tree {
    node *root;
    int size;
}tree;

tree *initTree() {
    tree *t = (tree *)malloc(sizeof(tree));
    t->root = NULL;
    t->root = NULL;
    return t;
}

node *initNode(int k) {
    node *n = (node *)malloc(sizeof(node));
    n->left = NULL;
    n->right = NULL;
    n->p = NULL;
    n->key = k;
    n->isRed = 0;
    return n;
}

int Height(node *n) {
    int r=0, l=0;
    if (n->right != NULL)
        r = Height(n->right);
    if (n->left != NULL)
        l = Height(n->left);
    return 1 + (r>l ? r:l);
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

int Height_P(node *n) {
    int r=0, l=0;
    if (n->right != NULL)
        r = Height_P(n->right) + 1;
    if (n->left != NULL)
        l = Height_P(n->left) + 1;
    return 1 + (r>l ? r:l);
}

int print(node *n, int isLeft, int offset, int depth, char treeStr[20][255]) {
    char b[5];
    int width=3;

    if (n == NULL) {
        return 0;
    }

    sprintf(b, "%c%02d", n->isRed?'R':'B', n->key);

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
    height = Height_P(root);

    for(int i=0; i<height; i++) {
        printf("%s\n", treeStr[i]);
    }
    printf("\n");
}

void LEFT_ROTATE(tree *T, node *x) {
    node *y = x->right;
    x->right= y->left;
    if(y->left != NULL) {
        y->left->p = x;
    }
    y->p = x->p;
    if(x->p == NULL) {
        T->root = y;
    }
    else if(x == x->p->left) {
        x->p->left = y;
    }
    else {
        x->p->right = y;
    }
    y->left = x;
    x->p = y;
}

void RIGHT_ROTATE(tree *T, node *x) {
    node *y = x->left;
    x->left = y->right;
    if(y->right != NULL) {
        y->right->p = x;
    }
    y->p = x->p;
    if(x->p == NULL) {
        T->root = y;
    }
    else if(x == x->p->right) {
        x->p->right = y;
    }
    else {
        x->p->left = y;
    }
    y->right = x;
    x->p = y;
}

void RB_INSERT_FIXUP(tree *T, node *z) {
    node *y;
    if (z->p != NULL && z->p->p != NULL) {
        while (z != NULL && z->p != NULL && z->p->p != NULL && z->p->isRed) {
            if (z->p == z->p->p->left) {
                y = z->p->p->right;
                if (y != NULL && y->isRed) {
                    z->p->isRed = 0;
                    y->isRed = 0;
                    z->p->p->isRed = 1;
                    z = z->p->p;
                }
                else {
                    if (z == z->p->right) {
                        z = z->p;
                        LEFT_ROTATE(T, z);
                    }
                    z->p->isRed = 0;
                    z->p->p->isRed = 1;
                    RIGHT_ROTATE(T, z->p->p);
                }
            }
            else {
                node *y = z->p->p->left;
                if (y != NULL && y->isRed) {
                    z->p->isRed = 0;
                    y->isRed = 0;
                    z->p->p->isRed = 1;
                    z = z->p->p;
                }
                else {
                    if (z == z->p->left) {
                        z = z->p;
                        RIGHT_ROTATE(T, z);
                    }
                    z->p->isRed = 0;
                    z->p->p->isRed = 1;
                    LEFT_ROTATE(T, z->p->p);
                }
            }
        }
    }
    T->root->isRed = 0;
}

void RB_INSERT(tree *T, int x) {
    node *cur, *prev=NULL;
    node *z = initNode(x);
    z->isRed = 1;
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
    RB_INSERT_FIXUP(T, z);
    T->size ++;
}

void RB_DELETE_FIXUP(tree *T, node *x) {
    node *y;
    while (x != T->root && !x->isRed) {
        if(x->p->left == x) {
            y = x->p->right;
            if (y->isRed) {
                y->isRed = 0;
                x->p->isRed = 1;
                LEFT_ROTATE(T, x->p);
                y = x->p->right;
            }
            if(!y->right->isRed && !y->left->isRed) {
                y->isRed = 1;
                x = x->p;
            }
            else {
                if(!y->right->isRed) {
                    y->left->isRed = 0;
                    y->isRed = 1;
                    RIGHT_ROTATE(T, y);
                    y = x->p->right;
                }
                y->isRed = x->p->isRed;
                x->p->isRed = 0;
                y->right->isRed = 0;
                LEFT_ROTATE(T, x->p);
                x = T->root;
            }
        }
        else {
            y = x->p->left;
            if(y->isRed) {
                y->isRed = 0;
                x->p->isRed = 1;
                RIGHT_ROTATE(T, x->p);
                y = x->p->left;
            }
            if(!y->left->isRed && !y->right->isRed) {
                y->isRed = 1;
                x = x->p;
            }
            else {
                if(!y->left->isRed) {
                    y->right->isRed = 0;
                    y->isRed = 1;
                    LEFT_ROTATE(T, y);
                    y = x->p->left;
                }
                y->isRed = x->p->isRed;
                x->p->isRed = 0;
                y->left->isRed = 0;
                RIGHT_ROTATE(T, x->p);
                x = T->root;
            }
        }
        x->isRed = 0;
        T->root->isRed = 0;
    }
}

void RB_DELETE(tree *T, int tar) {
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
        if(!y->isRed && x != NULL) {
            RB_DELETE_FIXUP(T, x);
        }
    }
}

int main() {
    int A[20], size;
    tree *BST = initTree();
    tree *RBT = initTree();
    srand(time(NULL));
    for(int i=0; i<20; i++) {
        A[i] = rand()%50;
        printf("%d ", A[i]);
    }
    printf("\n");
    for(int i=0; i<20; i++) {
        TREE_INSERT(BST, A[i]);
        RB_INSERT(RBT, A[i]);
    }
    printf("BST:\n");
    PRINT_BST(BST);
    printf("RBT:\n");
    PRINT_BST(RBT);
    printf("5) Compare Height:   BST: %d  RBT:%d\n\n", Height(BST->root), Height(RBT->root));

    size = RBT->size;
    printf("## Insert 5\n");
    RB_INSERT(RBT, 5);
    if(size != RBT->size) {
        PRINT_BST(RBT);
        size = RBT->size;
    }
    printf("## Insert 7\n");
    RB_INSERT(RBT, 7);
    if(size != RBT->size) {
        PRINT_BST(RBT);
        size = RBT->size;
    }
    printf("## Insert 17\n");
    RB_INSERT(RBT, 17);
    if(size != RBT->size) {
        PRINT_BST(RBT);
        size = RBT->size;
    }
    printf("## Insert 51\n");
    RB_INSERT(RBT, 51);
    if(size != RBT->size) {
        PRINT_BST(RBT);
        size = RBT->size;
    }

    printf("## Delete 17\n");
    RB_DELETE(RBT, 17);
    PRINT_BST(RBT);
    printf("## Delete 5\n");
    RB_DELETE(RBT, 5);
    PRINT_BST(RBT);
    printf("## Delete 51\n");
    RB_DELETE(RBT, 51);
    PRINT_BST(RBT);
    printf("## Delete 17\n");
    RB_DELETE(RBT, 17);
    PRINT_BST(RBT);

    return 0;
}
