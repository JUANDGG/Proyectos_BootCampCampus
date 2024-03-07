
package com.mycompany.apuntes;


public class UsuarioBuilder  implements BuilderUsuario{
        
        Usuario usuario = new Usuario();

        @Override
        public BuilderUsuario persona(Persona persona) {
                   usuario.setPersona(persona);
                   /*
                        cuando returno this basicamente retor el objecto BuiderUsuario 
                        pero dentro del contexto UsuarioBuilder osea dentro del contexto de la clase que estamos trabajando
                   */
                   return this;
        }

        @Override
        public BuilderUsuario contrasena(String  contrasena) {
                   usuario.setContrasena(contrasena);
                   return this ;
        }
        
        
        /*
        
        cuando agarramos un objecto ya creado como tipo de dato a devolver 
        esto no se puede hacer por que estamos devolviendo una instancea y no estampos queriendo devolver un instancea o sea q no se puede
            public usuario cargado(){
                   return usuario ;
        }
        
        */
        
        
        @Override
        public Usuario cargado(){
                   return usuario ;
        }
        
        
        
        
}   
