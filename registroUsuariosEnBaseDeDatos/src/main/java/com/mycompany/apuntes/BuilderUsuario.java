
package com.mycompany.apuntes;


public  interface BuilderUsuario {
        BuilderUsuario persona(Persona persona);
        BuilderUsuario contrasena(String contrasena);
        Usuario cargado();
}
