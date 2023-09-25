//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdlib.h>
#include <stdio.h>

float minimo(float vector[2001],int n){

	int i;
	float minimo;
	minimo  = vector[0];
	
	for(i=0;i<n;i++){
		if(minimo>vector[i]){
			minimo = vector[i];
		}
	}
	
	return minimo;

}

int main(){
	
	int lineas,i;
	scanf("%d",&lineas);

	for(i=0;i<lineas;i++){
	
		int n,j;
		float resultado,vector[2001];
		scanf("%d",&n);
		
		for(j=0;j<n;j++){
			float k;
			scanf("%f",&k);
			vector[j]=k;
		}
		
		resultado = minimo(vector,n);
		printf("%f\n",resultado);
		
	}

	return EXIT_SUCCESS;

}
