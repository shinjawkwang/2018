#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int add_cnt;
int mul_cnt;
int sub_cnt;

typedef struct matrix {
    int **arr;
} mt;

mt* CreateMatrix(int size) {
    mt *matrix = (mt *)malloc(sizeof(mt));
    matrix->arr = (int **)malloc(sizeof(int*) * size);
    for(int i=0; i<size; i++) {
        matrix->arr[i] = (int *)malloc(sizeof(int) * size);
    }
    return matrix;
}

void Divide(mt *c1, mt *c2, mt *c3, mt *c4, mt *before, int size) {
    int row=0, col=0, i, j;
    for(i=0; i<size; i++) {
        for(j=0; j<size; j++) {
            c1->arr[i][j] = before->arr[row+i][col+j];
        }
    }
    row=0;
    col=size;
    for(i=0; i<size; i++) {
        for(j=0; j<size; j++) {
            c2->arr[i][j] = before->arr[row+i][col+j];
        }
    }
    row = size;
    col = 0;
    for (i=0; i<size; i++) {
        for (j=0; j<size; j++) {
            c3->arr[i][j] = before->arr[row+i][col+j];
        }
    }
    row = size;
    col = size;
    for (i=0; i<size; i++) {
        for (j=0; j<size; j++) {
            c4->arr[i][j] = before->arr[row+i][col+j];
        }
    }
}

mt* Conquer(mt *c1, mt* c2, mt *c3, mt *c4, int size) {
    mt *result = CreateMatrix(size*2);
    int row=0, col=0, i, j;
    for(i=0; i<size; i++) {
        for(j=0; j<size; j++) {
            result->arr[row+i][col+j] = c1->arr[i][j];
        }
    }
    row = 0;
    col = size;
    for(i=0; i<size; i++) {
        for(j=0; j<size; j++) {
            result->arr[row+i][col+j] = c2->arr[i][j];
        }
    }
    row = size;
    col = 0;
    for(i=0; i<size; i++) {
        for(j=0; j<size; j++) {
            result->arr[row+i][col+j] = c3->arr[i][j];
        }
    }
    row = size;
    col = size;
    for(i=0; i<size; i++) {
        for(j=0; j<size; j++) {
            result->arr[row+i][col+j] = c4->arr[i][j];
        }
    }
    return result;
}

mt* mAdd(mt *a, mt *b, int size) {
    mt *result = CreateMatrix(size);
    for(int i=0; i<size; i++) {
        for(int j=0; j<size; j++) {
            result->arr[i][j] = a->arr[i][j] + b->arr[i][j];
            add_cnt++;
        }
    }
    return result;
}

mt* mSub(mt *a, mt *b, int size) {
    mt *result = CreateMatrix(size);
    for(int i=0; i<size; i++) {
        for(int j=0; j<size; j++) {
            result->arr[i][j] = a->arr[i][j] - b->arr[i][j];
            sub_cnt++;
        }
    }
    return result;
}

void standard(mt *a, mt *b, mt *c, int size) {
    for(int i=0; i<size; i++) {
        for(int j=0; j<size; j++) {
            c->arr[i][j]= -1;
            for(int k=0; k<size; k++) {
                if(c->arr[i][j] == -1) {
                    c->arr[i][j] = a->arr[i][k] * b->arr[k][j];
                    mul_cnt++;
                }
                else {
                    c->arr[i][j] += a->arr[i][k] * b->arr[k][j];
                    add_cnt++;
                    mul_cnt++;
                }
            }
        }
    }
}

void recursion(mt *a, mt *b, mt *c, int rowA, int colA, int rowB, int colB, int size) {
    int nxt;
    if(size==1) {
        if(c->arr[rowA][colB] == -1) {
            c->arr[rowA][colB] = a->arr[rowA][colA] * b->arr[rowB][colB];
            mul_cnt++;
        }
        else {
            c->arr[rowA][colB] += a->arr[rowA][colA] * b->arr[rowB][colB];
            mul_cnt++;
            add_cnt++;
        }
    }
    else {
        nxt = size/2;
        recursion(a, b, c, rowA, colA, rowB, colB, nxt);
        recursion(a, b, c, rowA, colA+nxt, rowB+nxt, colB, nxt);
        recursion(a, b, c, rowA, colA, rowB, colB+nxt, nxt);
        recursion(a, b, c, rowA, colA+nxt, rowB+nxt, colB+nxt, nxt);
        recursion(a, b, c, rowA+nxt, colA, rowB, colB, nxt);
        recursion(a, b, c, rowA+nxt, colA+nxt, rowB+nxt, colB, nxt);
        recursion(a, b, c, rowA+nxt, colA, rowB, colB+nxt, nxt);
        recursion(a, b, c, rowA+nxt, colA+nxt, rowB+nxt, colB+nxt, nxt);
    }
}

mt* strassen(mt *a, mt *b, int size) {
    mt *da, *db, *dc, *dd, *de, *df, *dg, *dh;
    mt *p1, *p2, *p3, *p4, *p5, *p6, *p7;
    mt *r, *s, *t, *u;
    mt *result=CreateMatrix(size);
    if(size==1) {
        result->arr[0][0] = a->arr[0][0] * b->arr[0][0];
        mul_cnt++;
    }
    else {
        da=CreateMatrix(size/2);
        db=CreateMatrix(size/2);
        dc=CreateMatrix(size/2);
        dd=CreateMatrix(size/2);
        de=CreateMatrix(size/2);
        df=CreateMatrix(size/2);
        dg=CreateMatrix(size/2);
        dh=CreateMatrix(size/2);

        Divide(da, db, dc, dd, a, size/2);
        Divide(de, df, dg, dh, b, size/2);
        p1 = strassen(da, mSub(df, dh, size/2), size/2);
        p2 = strassen(mAdd(da, db ,size/2), dh, size/2);
        p3 = strassen(mAdd(dc, dd, size/2), de, size/2);
        p4 = strassen(dd, mSub(dg, de, size/2), size/2);
        p5 = strassen(mAdd(da, dd, size/2), mAdd(de, dh, size/2), size/2);
        p6 = strassen(mSub(db, dd, size/2), mAdd(dg, dh, size/2), size/2);
        p7 = strassen(mSub(da, dc, size/2), mAdd(de, df, size/2), size/2);

        r = mAdd(mSub(mAdd(p5, p4, size/2), p2, size/2), p6, size/2);
        s = mAdd(p1, p2, size/2);
        t = mAdd(p3, p4, size/2);
        u = mSub(mSub(mAdd(p5, p1, size/2), p3, size/2), p7, size/2);

        result = Conquer(r, s, t, u, size/2);
    }
    return result;
}

int main() {
    mt *A4, *B4, *C4;
    mt *A8, *B8, *C8;
    int randnum, cnt;
    A4 = CreateMatrix(4);
    B4 = CreateMatrix(4);
    C4 = CreateMatrix(4);
    A8 = CreateMatrix(8);
    B8 = CreateMatrix(8);
    C8 = CreateMatrix(8);
    
    srand(time(NULL));
    for(int i=0; i<4; i++) {
        for(int j=0; j<4; j++) {
            randnum = rand()%1000;
            A4->arr[i][j] = randnum;
            randnum = rand()%1000;
            B4->arr[i][j] = randnum;
            C4->arr[i][j] = -1;
        }
    }
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            randnum = rand()%1000;
            A8->arr[i][j] = randnum;
            randnum = rand()%1000;
            B8->arr[i][j] = randnum;
            C8->arr[i][j] = -1;
        }
    }

    printf(">>> 4x4 Matrices\n");
    for(int i=0; i<4; i++) {
        for(int j=0; j<4; j++) {
            printf("%4d\t", A4->arr[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=0; i<4; i++) {
        for(int j=0; j<4; j++) {
            printf("%4d\t", B4->arr[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    standard(A4, B4, C4, 4);
    for(int i=0; i<4; i++) {
        for(int j=0; j<4; j++) {
            printf("%8d  ", C4->arr[i][j]);
        }
        printf("\n");
    }
    printf("4x4 Standard: multiply-%d add-%d substract-%d => %d\n", mul_cnt, add_cnt, sub_cnt, mul_cnt+add_cnt+sub_cnt);
    for(int i=0; i<4; i++) {
        for(int j=0; j<4; j++) {
            C4->arr[i][j] = -1;
        }
    }
    mul_cnt = 0;
    add_cnt = 0;
    sub_cnt = 0;
    recursion(A4, B4, C4, 0, 0, 0, 0, 4);
    for(int i=0; i<4; i++) {
        for(int j=0; j<4; j++) {
            printf("%8d  ", C4->arr[i][j]);
        }
        printf("\n");
    }
    printf("4x4 Recursion: multiply-%d add-%d substract-%d => %d\n", mul_cnt, add_cnt, sub_cnt, mul_cnt+add_cnt+sub_cnt);

    printf("\n");
    mul_cnt = 0;
    add_cnt = 0;
    sub_cnt = 0;
    C4 = strassen(A4, B4, 4);
    for(int i=0; i<4; i++) {
        for(int j=0; j<4; j++) {
            printf("%8d  ", C4->arr[i][j]);
        }
        printf("\n");
    }
    printf("4x4 Strassen: multiply-%d add-%d substract-%d => %d\n", mul_cnt, add_cnt, sub_cnt, mul_cnt+add_cnt+sub_cnt);

    // ========================================= 8*8

    mul_cnt = 0;
    add_cnt = 0;
    sub_cnt = 0;
    printf("\n>>> 8x8 Matrices\n");
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            printf("%4d\t", A8->arr[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            printf("%4d\t", B8->arr[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    standard(A8, B8, C8, 8);
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            printf("%8d  ", C8->arr[i][j]);
        }
        printf("\n");
    }
    printf("8x8 Standard: multiply-%d add-%d substract-%d => %d\n", mul_cnt, add_cnt, sub_cnt, mul_cnt+add_cnt+sub_cnt);
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            C8->arr[i][j] = -1;
        }
    }

    printf("\n");
    mul_cnt = 0;
    add_cnt = 0;
    sub_cnt = 0;
    recursion(A8, B8, C8, 0, 0, 0, 0, 8);
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            printf("%8d  ", C8->arr[i][j]);
        }
        printf("\n");
    }
    printf("8x8 Recursion: multiply-%d add-%d substract-%d => %d\n", mul_cnt, add_cnt, sub_cnt, mul_cnt+add_cnt+sub_cnt);

    printf("\n");
    mul_cnt = 0;
    add_cnt = 0;
    sub_cnt = 0;
    C8 = strassen(A8, B8, 8);
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            printf("%8d  ", C8->arr[i][j]);
        }
        printf("\n");
    }
    printf("8x8 Strassen: multiply-%d add-%d substract-%d => %d\n", mul_cnt, add_cnt, sub_cnt, mul_cnt+add_cnt+sub_cnt);
    return 0;
}
