//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdlib.h>
#include <stdio.h>

//funcion  conocer el signo y realizar dicha operacion
float calculadora(char signo, float a, float b){
	
	float operacion;

	if(signo == '+'){
		operacion = a + b;
	}
	
	if(signo == '-'){
		operacion = a - b;
	}
	
	if(signo == '*'){
		operacion = a * b;
	}
	
	if(signo == '/'){
		operacion = a / b;
	}

	return operacion;

}

int main(){

	int lineas,i;
	
	scanf("%d",&lineas);
	
	for(i=0;i<lineas;i++){
		
		char signo[2];
		float a,b,resultado;
		
		scanf("%1s",&signo);
		scanf("%f",&a);
		scanf("%f",&b);
		
		resultado = calculadora(signo[0],a,b);
		printf("%f\n",resultado);
	}
	
	
	return EXIT_SUCCESS;
	
}
