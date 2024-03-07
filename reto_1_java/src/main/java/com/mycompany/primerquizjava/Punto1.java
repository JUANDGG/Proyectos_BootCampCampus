



package com.mycompany.primerquizjava;

import java.util.Scanner;


public class Punto1 {
    
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("ingrese el limite que desea :");
        
        int limite = scanner.nextInt();
        
        int contador = 0 ;
        
        for (int i = 1; i < limite; i++) {
            
            if((i % 3 ==0) || (i % 5 ==0)){
                contador = contador + i ;
            }
        }
       
       
        System.out.println("el resultado es : " + contador );
    }
    
}
