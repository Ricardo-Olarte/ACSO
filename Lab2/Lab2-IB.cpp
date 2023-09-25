//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdlib.h>
#include <stdio.h>

int main(){
	
	//Asignar los enteros, lineas de cuantos numeros se deben pedir, e i como iterador
	int lineas,i;
	scanf("%d",&lineas);
	for(i=0;i<lineas;i++){
		
	//Asignacion de las variables, los dos numeros reales
		float a,b;
		scanf("%f",&a);
		scanf("%f",&b);

	//Condicional para imprimir el numero mayor
		if(a>b){
			printf("%f\n",a);
		}else{
			printf("%f\n",b);
		}
}
	
	return EXIT_SUCCESS;
}
