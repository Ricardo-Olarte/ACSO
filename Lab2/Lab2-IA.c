//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdlib.h>
#include <stdio.h>

int main(void){

	//Se pide el numero de lineas, e i como el iterador
	int lineas,i;
	scanf("%d",&lineas);

	for(i=0;i<lineas;i++){
		//Enteros del ejercicio
		int a,b,suma;

		scanf("%d",&a);
		scanf("%d",&b);
		
		//Suma de enteros y Escribir por pantalla
		suma = a + b;
		printf("%d\n",suma);
	}

	return EXIT_SUCCESS;
}
