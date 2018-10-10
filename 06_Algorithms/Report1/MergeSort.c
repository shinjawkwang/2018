#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int Merge(int *arr, int low, int mid, int high) {
    int cnt=0, pos_l=low, pos_m=mid+1, pos=low;
    int tmp[100];
    while(pos_l<=mid && pos_m<=high) {
        if(arr[pos_l] <= arr[pos_m]) {
            tmp[pos] = arr[pos_l];
            pos_l++;
        }
        else {
            tmp[pos] = arr[pos_m];
            pos_m++;
        }
        cnt++;
        pos++;
    }
    if(pos_l<=mid) {
        for(; pos_l<=mid; pos_l++) {
            tmp[pos] = arr[pos_l];
            pos++;
        }
    }
    if(pos_m<=high) {
        for(; pos_m<=high; pos_m++) {
            tmp[pos] = arr[pos_m];
            pos++;
        }
    }

    for(int i=low; i<=high; i++) {
        arr[i] = tmp[i];
    }
    return cnt;
}

int MergeSort(int *arr, int low, int high) {
    int cnt = 0;
    int mid;
    if(low < high) {
        mid = (low+high) / 2;
        cnt += MergeSort(arr, low, mid);
        cnt += MergeSort(arr, mid+1, high);
        cnt += Merge(arr, low, mid, high);
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
    cnt = MergeSort(A, 0, 99);
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
    cnt = MergeSort(A, 0, 99);
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
    cnt = MergeSort(A, 0, 99);
    for(int i=0; i<100; i++) {
        printf("%d\t", A[i]);
        if(i%10 == 9) {
            printf("\n");
        }
    }
    printf("**** number of comparisons of (3) : %d\n", cnt);
    return 0;
}