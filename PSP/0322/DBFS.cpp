#include <stdio.h>
#include <vector>
using namespace std;

int main () {
	int n, m, v; // n: 정점 개수 m: 간선 개수 v: 탐색을 시작할 정점의 번호
	int inpta, inptb;
	scanf("%d%d%d", &n, &m, &v);
	
	vector<int> visited(n, 0);
	vector<int> graph[n];

	for(int i=0; i<m; i++) {
		scanf("%d%d", &inpta, &inptb);
		graph[inpta].push_back(inptb);
		graph[inptb].push_back(inpta);
	}
	printf("Input Success\n");
	for(int i=0; i<n; i++){
		for(int j=0; j<graph[i].size(); j++){
			printf("%d ", graph[i][j]);
		}
		printf("\n");
	}
	return 0;
}
