
package ejercicio2;


public abstract class Persona {
    
    
    
    /*
    
    NOTA :
    
    A ESTA CLASE NO LE ANADI NINGUN METODO ABSTRAPCTO YA QUE NO SABIA PARTICULARMENTE
    QUE METODO CREAR PARA QUE LO HEREDARAN LAS CLASES QUE EXTENDIERAN ESTA SUPER CLASE
    SE QUE ES UNA MALA PRACTICA DEJAR VACIO UN METODO ABSTRACTO Y QUE SERIA MEJOR DEJARLO COMO 
    UNA CLASE NORMAL PERO ME HE FIJADO QUE LA CLASE PERSONA IDENTIFICA Y GENERALIZA MUCHAS PERSONAS POR LO CUAL ES ABSTRABCTO
    YA QUE SI QUEREMOS ESCALAR EL PROGRAMA SE TENDRA EN CUENTA LA POBLACION A LA QUE NO DIRIGIREMOS POR LO CUAL SERIA
    ALGO ABSURDO BASARLA PARA PODERLA INSTANCEAR CUANDO SENCILLAMENTE LA PODEMOS UTILZAR COMO PLATILLA
    
    
    */
    
    /*--------------------ATRIBUTOS-----------------------*/
    private String nombre;
    private String telefono;
    private String correo;
    
    /*/////////////////////////////////////////////////////////*/
    
    /*--------------------CONSTRUTORES-----------------------*/
    
    public Persona (String nombre , String telefono, String correo){
        this.setNombre(nombre);
        this.setTelefono(telefono);
        this.setCorreo(correo);
        
    }
    /*/////////////////////////////////////////////////////////////*/
    
    
    /*--------------------METODOS SETTERS-----------------------*/
    
    public void setNombre(String nombre) {
        String regex = "^[A-Za-z]+$";


        
        if(!nombre.matches(regex)){
            throw new RuntimeException(
            """
            
            EL NOMBRE DE LA PERSONA QUE DESEAS AGREGAR TIENE UN FORMATO INVALIDO 
            REVISA QUE NO TENGA NUMEROS NI ESPACIOS SOLO CARACTERES
            POR FAVOR VALIDELO Y VUELVA A INTENTARLO !!
            
            """);
        }
        
        this.nombre = nombre;
    }

    public void setTelefono(String telefono) {
        String regex = "^[0-9]+$";
        if(!telefono.matches(regex)){
             throw new RuntimeException(
            """
            
            EL TELEFONO DE LA PERSONA QUE DESEAS AGREGAR TIENE UN FORMATO INVALIDO 
            REVISA QUE NO TENGA CARACTERES NI ESPACIOS SOLO NUMEROS
            POR FAVOR VALIDELO Y VUELVA A INTENTARLO !!
            
            """);
        }
         
        this.telefono = telefono;
    }

    public void setCorreo(String correo) {
        String regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$";
        
        if (!correo.matches(regex)) {
            throw new RuntimeException("EL CORREO DE LA PERSONA QUE DESEAS AGREGAR TIENE UN FORMATO INVALIDO POR FAVOR VALÍDELO Y VUELVA A INTENTARLO !!");
        }

        
        this.correo = correo;
    }

  
    
    
    /*//////////////////////////////////////////////////*/
    
    /*--------------------METODOS GETTERS-----------------------*/

    public String getNombre() {
        return this.nombre;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public String getCorreo() {
        return this.correo;
    }

   
    
    /*//////////////////////////////////////////////////*/
    
    
    /*--------------------TO STRING-----------------------*/
    @Override
    public String toString() {
        return
        """
        nombre   : """+ this.getNombre() +"""
                                          
        telefono : """+this.getTelefono() +"""
                                           
        correo   : """+this.getCorreo() +"""                                 
              
        """ ;
                
    }
    
    /*//////////////////////////////////////////////////*/

    
}
