#include <stdio.h>
#include <algorithm>
using namespace std;

int comp(int a, int b){
	return a < b;
}

typedef struct pair {
	int x;
	int y;
}pa;

int main() {
	int n, i, j, a, b;
	pa pair[110110];
	scanf("%d", &n);
	for(i=0; i<n; i++) {
		scanf("%d%d", a,b);
		pair[i].x = a;
		pair[i].y = b;
	}
	for(i=0; i<n; i++) 
		printf("%d %d\n", pair[i].x, pair[i].y);	

	return 0;
}
