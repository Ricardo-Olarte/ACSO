//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdio.h>
#include <stdlib.h>

int main(){
	
	float suma,a[2001],b[2001];
	int casos, longitud, i,j;
	
	scanf("%d",&casos);
	
	for(i=0;i<casos;i++){
		
		suma = 0;
		scanf("%d",&longitud);
				
		for(j=0;j<longitud;j++){
			scanf("%f",&a[j]);
		}
		
		for(j=0;j<longitud;j++){
			scanf("%f",&b[j]);
			suma += (a[j] * b[j]);
		}
		
		printf("%f\n",suma);
	}
	
	return EXIT_SUCCESS;	
}
