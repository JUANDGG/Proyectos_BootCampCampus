
package com.mycompany.apuntes;


public class Principal {
    public static void main(String[] args) {
        
        // constructir persona y usuario
        BuilderPersona builder = new BuilderPersona();
        BuilderUsuario usuarioCrear= new UsuarioBuilder();  
         
         // se va a guardar el objecto que ya se contruyo 
         Persona personaConstruido = 
                 /* esta encadenacion se puede hacer porque al retornarse 
                       a si mismo como objecto  basicamente puedo llamar algun
                       otro de sus metodos cosa que no se puede hacer si digamos no returnara otro objecto
                 */
                 
                 builder.nombre("juan david")
                .apellido("asd")
                .edad(20)
                .cargado();

         
         
        Usuario usuario  = usuarioCrear.persona(personaConstruido)
                .contrasena("Juan123") 
                .cargado();
         
        }
    
        
 
}
