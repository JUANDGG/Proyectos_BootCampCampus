
package com.mycompany.apuntes;


public class Usuario {
        private Persona  persona ;
        private String contrasena ;

        public Usuario() {
        
        }
        
        
        
        /////////Setters///////////
        public void setPersona(Persona persona) {
            this.persona = persona;
        }

        public void setContrasena(String contrasena) {
            this.contrasena = contrasena;
        }

        ///////////////////////////
        
        ////////getters///////
        public Persona getPersona() {
            return persona;
        }

        //////////////////////////
        
        
        
        
        
}
