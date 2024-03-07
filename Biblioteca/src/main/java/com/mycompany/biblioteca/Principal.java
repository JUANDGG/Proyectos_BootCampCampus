/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.biblioteca;

import java.util.Scanner;

/**
 *
 * @author user
 */
public class Principal {
    public static void main(String[] args) {
        
        // creacion de libros
        
        Scanner entrada =new  Scanner(System.in);
        for (int i = 0; i < 2; i++) {
                   //nombre libro 
                   System.out.print("ingresa el nombre del libro  : ");
                   String nombre = entrada.nextLine();
                   
                   System.out.print("ingresa el nombre del autor del libro  : ");
                   String nombreAutor = entrada.nextLine();
                   
                   Recurso libro = new Libro(nombre,nombreAutor);
                   
                   System.out.println(libro.toString());
                   
        }
        
       
        
    }
}
