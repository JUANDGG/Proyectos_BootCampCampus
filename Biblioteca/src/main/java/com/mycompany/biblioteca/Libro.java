/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.biblioteca;

/**
 *
 * @author user
 */
public class Libro extends Recurso {
        private String autor ;
        private static int incrementable  =0;
        
        
        public Libro(String titulo,String autor) {
            super(titulo);
            this.autor = autor;
            this.setId(incrementable++);
            
           
        }
        
      
        
        // getters
        
        public String getAutor() {
            return autor;
        }

        // setters

        public void setAutor(String autor) {
            this.autor = autor;
        }

        
        
        
       @Override
        public String toString() {
            return 
                    "id del libro : " + super.getId()  + "\n"+ 
                    "titulo libro :" + super.getTitulo() +"\n"+
                    "disponibilidad: " +super.getDisponible() + "\n" + 
            
                    "autor  libro:" + this. getAutor()+ "\n" ;
                    
        }
    
}
 