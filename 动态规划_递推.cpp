#include<iostream>
#include<algorithm>
using namespace std;
#define MAX 101
int D[MAX][MAX];
int n;
int maxSum[MAX][MAX];
int main()
{
	int i,j;
	cin>>n;
	for(i=1;i<=n;i++)
	{
		for(j=1;j<=n;j++)
		{
			cin>>D[i][j];
		}
	}
	for(int i=1;i<=n;i++)
	{
		maxSum[n][i]=D[i][j];
	}
	for(int i=n-1;i>=1;i++)
	{
		for(j=1;j<=i;++j)
		{
			maxSum[i][j]=max(maxSum[i+1][j],maxSum[i+1][j+1])+D[i][j];
			//maxSum[n-1][j]=max(maxSum[n][j],maxSum[n][j+1]+D[n-1][j]
		}
	}
}
