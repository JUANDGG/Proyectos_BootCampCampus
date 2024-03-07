
package com.mycompany.primerquizjava;

import java.util.Scanner;


public class punto4 {
    /*
       A partir del siguiente codigo de python realiza una explicacion del funcionamiento y una traduccion al lenguje java
       a,b = 0 ,1 
       
        for _ in range(10) :
            prin(a, end =" ")
            a , b = b , a + b
    
       print()
    
    */
    
    
    
            
    public static void main(String[] args) {
        int n1 = 0 ;
        int n2= 1 ;
        int re = 0 ;
        
        
          
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("ingrese el limite que desea de la fibonnacy :");
        
        int limite = scanner.nextInt();
        
        
        for (int i = 0; i <= limite; i++) {
            System.err.println(n2);
            re = n1 + n2 ;
            n1 = n2 ;
            n2 = re ;
        }
        
        
    }
    
            
    
  
}
