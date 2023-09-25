//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

//Funcion que retorna booleano para conocer si dicho numero es primo
bool primo(int n){
	
	int i,cont = 0;
	for(i=1;i<=(n/2);i++){
		if(n%i == 0){
			cont++;
		}
	}
	if(cont==1){
		return true;
	}
	return false;
}

//Buscar el maximo divisor
int maximoDivisor(int a, int b, int c, int d, int e){
	
	int i,max = 0,maximo = 1;
	
	if(a>=max){
		max = a;
	}
	if(b>=max){
		max = b;
	}
	if(c>=max){
		max = c;
	}
	if(d>=max){
		max = d;
	}
	if(e>=max){
		max = e;
	}
	
	for(i=max;i>=1;i--){
		if(primo(i) && a%i==0 && b%i==0 && c%i==0 && d%i==0 && e%i==0){
			maximo = maximo * i;
		}
	}
	
	return maximo;
}

int main(){
	
	int belgica,inglaterra,noruega,irlanda,francia;
	
	scanf("%d",&belgica);
	scanf("%d",&inglaterra);
	scanf("%d",&noruega);
	scanf("%d",&irlanda);
	scanf("%d",&francia);
	
	int maximo,suma;
	
	maximo = maximoDivisor(belgica,inglaterra,noruega,irlanda,francia);
	suma = belgica/maximo + inglaterra/maximo + noruega/maximo + irlanda/maximo + francia/maximo;
	
	printf("%d\n",maximo);
	printf("%d\n",belgica/maximo);
	printf("%d\n",inglaterra/maximo);
	printf("%d\n",noruega/maximo);
	printf("%d\n",irlanda/maximo);
	printf("%d\n",francia/maximo);
	printf("%d\n",suma);
	
	return EXIT_SUCCESS;
}
