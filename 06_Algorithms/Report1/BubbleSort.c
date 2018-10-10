#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int BubbleSort(int *arr, int size) {
    int tmp, cnt=0;
    for(int i=0; i<size; i++) {
        for(int j=0; j<size-i-1; j++) {
            if(arr[j] > arr[j+1]) {
                tmp = arr[j];
                arr[j] = arr[j-1];
                arr[j-1] = tmp;
            }
            cnt++;
        }
    }
    return cnt;
}

int main() {
    int A[100], randnum, cnt;
    srand(time(NULL));

    /* 1) randomly filled array */
    printf("1) randomly filled array *****\n");
    for(int i=0; i<100; i++) {
        randnum = rand()%1000;
        A[i] = randnum;
    }
    cnt = BubbleSort(A, 100);
    for(int i=0; i<100; i++) {
        printf("%d\t", A[i]);
        if(i%10 == 9) {
            printf("\n");
        }
    }
    printf("**** number of comparisons of (1) : %d\n\n", cnt);

    /* 2) already sorted array */
    printf("2) already sorted array *****\n");
    for(int i=0; i<100; i++) {
        A[i] = i+1;
    }
    cnt = BubbleSort(A, 100);
    for(int i=0; i<100; i++) {
        printf("%d\t", A[i]);
        if(i%10 == 9) {
            printf("\n");
        }
    }
    printf("**** number of comparisons of (2) : %d\n\n", cnt);

    /* 3) reversly sorted array */
    printf("3) reversly sorted array *****\n");
    for(int i=0; i<100; i++) {
        A[i] = 100-i;
    }
    cnt = BubbleSort(A, 100);
    for(int i=0; i<100; i++) {
        printf("%d\t", A[i]);
        if(i%10 == 9) {
            printf("\n");
        }
    }
    printf("**** number of comparisons of (3) : %d\n", cnt);
    return 0;
}