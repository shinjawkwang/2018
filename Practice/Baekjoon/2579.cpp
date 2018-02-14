#include <stdio.h>
#include <vector>
#include <algorithm>
using namespace std;

int max(int a, int b){return a>b?a:b;}

int main(){
  int n, stair[330] = {0}, count[330][3] = {0};

  scanf("%d", &n);
  for(int i=1; i<=n; i++){
    scanf("%d", &stair[i]);
  }
  count[1][1] = stair[1];
  count[1][2] = stair[1];
  for(int i=2; i<=n; i++){
    count[i][1] = count[i-1][2] + stair[i];
    count[i][2] = max(count[i-2][1], count[i-2][2]) + stair[i];
  }
  printf("%d\n", max(count[n][1], count[n][2]));
  return 0;
}
