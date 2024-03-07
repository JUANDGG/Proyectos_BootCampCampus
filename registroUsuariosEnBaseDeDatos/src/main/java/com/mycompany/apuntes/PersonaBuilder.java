
package com.mycompany.apuntes;


public interface PersonaBuilder {
        PersonaBuilder nombre(String nombre) ;
        PersonaBuilder  apellido(String apellido);
        PersonaBuilder edad(int edad);
        Persona cargado();
        
        
        
}
