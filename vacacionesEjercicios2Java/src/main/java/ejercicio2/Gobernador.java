

package ejercicio2;


public class Gobernador  extends Persona{
    

    /*---------------------ATRIBUTOS------------------------*/
    private  String partidoPolitico;
    
    /*//////////////////////////////////////////////////////////*/

    /*---------------------CONSTRUCTORES------------------------*/

    
    public Gobernador(String nombre, String telefono, String correo, String partidoPolitico) {
        super(nombre, telefono, correo);
        this.setPartidoPolitico(partidoPolitico);
        
    }
    
    /*//////////////////////////////////////////////////////////*/
    /*---------------------METODOS SETTERS------------------------*/
    
    public void setPartidoPolitico(String partidoPolitico) {
        String regex = "^[A-Za-z]+$";
        if(!partidoPolitico.matches(regex)){
            throw new RuntimeException(
            """
            
            EL PARTIDO POLITICO QUE DESEAS AGREGAR TIENE UN FORMATO INVALIDO 
            REVISA QUE NO TENGA NUMEROS NI ESPACIOS SOLO CARACTERES
            POR FAVOR VALIDELO Y VUELVA A INTENTARLO !!
            
            """);
        }
        
        this.partidoPolitico = partidoPolitico;
    }
    
    /*//////////////////////////////////////////////////////////////*/

    
    /*---------------------METODOS GETTERS------------------------*/
    public String getPartidoPolitico() {
        return partidoPolitico;
    }
     
    /*////////////////////////////////////////////////////*/

    
    /*---------------------TO STRING------------------------*/
     @Override
    public String toString() {
        return
        """ 
               
        nombre   : """+ super.getNombre() +"""
                                          
        telefono : """+super.getTelefono() +"""
                                            
        correo   : """+super.getCorreo() +"""                                 
                                          
        partido politico : """+this.getPartidoPolitico()+""" 
                                                                                       
        """ ;
                
    }
    
    /*////////////////////////////////////////////////////*/

    
    
}
