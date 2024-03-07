/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.biblioteca;

/**
 *
 * @author user
 */
public class Revista extends Recurso {
        private int numeroRevista  ;
        private TipoRevista tipoRevista ;

        public Revista(int numeroRevista, TipoRevista tipoRevista, String titulo) {
            super(titulo);
            this.numeroRevista = numeroRevista;
            this.tipoRevista = tipoRevista;
        }

        
        
        
        // getters
        
        public int getNumeroRevista() {
            return numeroRevista;
        }

        public TipoRevista getTipoRevista() {
            return tipoRevista;
        }

        // setters
        
        public void setNumeroRevista(int numeroRevista) {
            this.numeroRevista = numeroRevista;
        }

        public void setTipoRevista(TipoRevista tipoRevista) {
            this.tipoRevista = tipoRevista;
        }
        
        
    
       @Override
        public String toString() {
            return 
                    "id de la revista : " + super.getId()  + "\n"+ 
                    "titulo revista :" + super.getTitulo() +"\n"+
                    "disponibilidad: " +super.getDisponible() + "\n" + 
            
                    "numero de la revista :" + this.getNumeroRevista() + "\n" +
                    "tipo de revista: " + this.getTipoRevista();
        }
    
}
