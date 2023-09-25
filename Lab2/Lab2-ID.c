//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdlib.h>
#include <stdio.h>

int suma(int vector[2001],int n){
	
	int i,sumatoria;
	
	sumatoria = 0;
	
	for(i=0;i<n;i++){
		sumatoria += vector[i];
	}
	return sumatoria;
}

int main(){

	int lineas,i;
	scanf("%d",&lineas);
	
	for(i=0;i<lineas;i++){

		int n,resultado,j,vector[2001];																																												
		scanf("%d",&n);
		
		for(j=0;j<n;j++){

			int k;
			scanf("%d",&k);
			vector[j]=k;
		}
		
		resultado = suma(vector,n);
		printf("%d\n",resultado);
		
	}

	return EXIT_SUCCESS;

}
