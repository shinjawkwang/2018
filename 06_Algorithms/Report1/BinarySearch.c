#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void Merge(int *arr, int low, int mid, int high) {
    int pos_l=low, pos_m=mid+1, pos=low;
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
}

void MergeSort(int *arr, int low, int high) {
    int mid;
    if(low < high) {
        mid = (low+high) / 2;
        MergeSort(arr, low, mid);
        MergeSort(arr, mid+1, high);
        Merge(arr, low, mid, high);
    }
}

int LSearch(int *arr, int key, int size) {
    int pos = 0;
    while(arr[pos]!=key) {
        pos++;
        if(pos==size) {
            return pos;
        }
    }
    return pos;
}

int BSearch(int *arr, int key, int size) {
    int low=0, high=size, cnt=0, mid;
    while(low<=high) {
        mid = (high+low) / 2;
        if(arr[mid] < key) {
            low = mid+1;
        }
        else if(arr[mid] > key) {
            high = mid-1;
        }
        else {
            return cnt+1;
        }
        cnt++;
    }
    return cnt;
}

int isExist(int *arr, int key, int size) {
    for(int i=0; i<size; i++) {
        if(arr[i] == key) {
            return 1;
        }
    }
    return 0;
}

int main() {
    int A[100], resultL[4], resultB[4], randnum, cnt, pos=0, flag=0, key;
    float avgL, avgB, sum=0;
    srand(time(NULL));

    for(int i=0; i<4; i++) {
        /* Create Array */
        pos = 0;
        while(pos < 100) {
            randnum = rand()%1000;
            while(isExist(A, randnum, pos)) {
                randnum = rand()%1000;
            }
            
            A[pos] = randnum;
            pos++;
        }
        key = rand()%1000;
        resultL[i] = LSearch(A, key, 100);
        MergeSort(A, 0, 99);
        resultB[i] = BSearch(A, key, 100);
        printf("%d - Linear: %d  Binary: %d\n", i+1, resultL[i], resultB[i]);
    }
    for(int i=0; i<4; i++) {
        sum += resultL[i];
    }
    avgL = (float)(sum / 4);
    sum = 0;
    for(int i=0; i<4; i++) {
        sum += resultB[i];
    }
    avgB = (float) (sum / 4);

    printf("\nAverage - Linear: %f  Binary: %f\n", avgL, avgB);    
    return 0;
}