/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.biblioteca;

/**
 *
 * @author user
 */
public abstract class Recurso {
    private static  int  id = 0 ;
    private  String titulo ;
    private  boolean disponible  = true;

    public Recurso(String titulo) {
        this.titulo = titulo;
        
    }


    /*-----------------------GETTERS-------------------------------*/

        public int getId() {
            return id;
        }

        public String getTitulo() {
            return titulo;
        }

        public boolean getDisponible() {
            return disponible;
        }
      
     /*//////////////////////////////////*/   
        
     /*-----------------------SETTERS-------------------------------*/

        public void setId(int id) {
            this.id = id;
        }

        public void setTitulo(String titulo) {
            this.titulo = titulo;
        }

        public void setDisponible(boolean disponible) {
            this.disponible = disponible;
        }
        
        /*//////////////////////////////////*/ 
        
        
          /*-----------------------TO STRING-------------------------------*/

        
        @Override
                abstract public String toString();
        
          /*//////////////////////////////////*/ 
    
}
