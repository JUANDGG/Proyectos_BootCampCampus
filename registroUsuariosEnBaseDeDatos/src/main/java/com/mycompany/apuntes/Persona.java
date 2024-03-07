
package com.mycompany.apuntes;


public class Persona {
        private  String  nombre;
        private String  apellido ;
        private int edad;
        
        ///////constructor para
        public Persona() {
                    //vacio
        }
        

        /*metodos setters*/
        public void setNombre(String nombre) {
            this.nombre = nombre;
        }

        public void setApellido(String apellido) {
            this.apellido = apellido;
        }

        public void setEdad(int edad) {
            this.edad = edad;
        }

          ///////////////////
      
        
        /*metodos getters*/
        public String getNombre() {
            return nombre;
        }

        public String getApellido() {
            return apellido;
        }

        public int getEdad() {
            return edad;
        }
        
        ///////////////////
        
        
        
}
