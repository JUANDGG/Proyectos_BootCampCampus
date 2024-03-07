
package com.mycompany.apuntes;


public class BuilderPersona implements PersonaBuilder{
    
        private Persona persona = new Persona();
        

        @Override
        public PersonaBuilder nombre(String nombre) {
                   persona.setNombre(nombre);
                   return this;
        }

        @Override
        public PersonaBuilder apellido(String apellido) {
                   persona.setApellido(apellido);
                   return this ;
        }

        @Override
        public PersonaBuilder edad(int edad) {
                  persona.setEdad(edad);
                  return this ;
        }

        @Override
        public Persona cargado() {
            return persona ;
        }
        
            
        
        
}
