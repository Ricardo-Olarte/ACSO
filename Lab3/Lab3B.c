//ELABORADO POR: JOSE RICARDO OLARTE PARDO

#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

//Devolver la posicion que pertenece el char
int darPosicion(char x){
	
	int i;
	char cadena[36] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
	for(i=0;i<36;i++){
		if(cadena[i]==x){
			return i;
		}
	}
	return 0;
}

//Devolver la posicion que pertenece N
char darNumero(int n){
	char cadena[36] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
	return cadena[n];
}

//Devuelve un string de manera reversa
char* reverso(char *numero){
	
	int i;
	static char nuevoNumero[5001]="";
	
	memset(nuevoNumero,0,strlen(nuevoNumero));
	
	for(i=0;i<strlen(numero);i++){
		nuevoNumero[i] = numero[strlen(numero)-i-1];
	}
	
	return nuevoNumero;
}

//Suma los numeros desde la base en las que se encuentran
char* sumarNumeros(int base, char *n1, char *n2){
	
	static char numero[5001]="", mayor[5001], menor[5001];
	
	memset(numero,0,strlen(numero));
	
	if(strlen(n1)>strlen(n2)){
		strncpy(mayor, n1, 5001);
		strncpy(menor, n2, 5001);
	}else{
		strncpy(mayor, n2, 5001);
		strncpy(menor, n1, 5001);
	}
	
	int i=strlen(mayor)-1,j=strlen(menor)-1,h=0,suma=0,carry=0;
	
	while(i>=0){
		
		suma += carry;
		carry = 0;
		
		if(j>=0){
			suma += darPosicion(menor[j]);
		}
		
		suma += darPosicion(mayor[i]);

		if(suma>=base){
			carry = (int) suma/base;
			suma = suma%base;
		}
		
		numero[h]=darNumero(suma);
		
		i--;
		j--;
		h++;
		suma = 0;
	}
	
	while(carry>=base){
		
		numero[h]=darNumero(carry%base);
		h++;
		numero[h]=darNumero((int)carry/base);
		carry = (int)carry/base;
	}
	
	if(carry>0){
		numero[h]=darNumero(carry);
	}
	
	carry=0;
	strncpy(numero, reverso(numero), 5001);
	
	return numero;
}

int main(){
	
	int casos,i;
	scanf("%d",&casos);
	
	for(i=0;i<casos;i++){
		
		int base,i,j,menor;
		char num1[5001],num2[5001],respuesta[5001];
		
		scanf("%d",&base);
		scanf("%s",num1);
		scanf("%s",num2);
		
		strncpy(respuesta,sumarNumeros(base,num1,num2), 5001);
		
		printf("%s\n",respuesta);
	}
	return EXIT_SUCCESS;
	
}

