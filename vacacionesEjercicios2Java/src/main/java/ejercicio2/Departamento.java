
package ejercicio2;



public class Departamento {
    
    
    /*---------------ATRIBUTOS--------------------------------*/
    private String nombre ;
    private Gobernador gobernador ;
    /*//////////////////////////////////////////////////*/
    
    /*---------------CONSTRUCTORES--------------------------------*/
    
    public Departamento(String nombre, Gobernador gobernador ) {
        this.setNombre(nombre);
        this.setGobernador(gobernador);
    }
    
    /*//////////////////////////////////////////////////*/

    /*---------------METODOS SETTERS----------------*/

    public void setNombre(String nombre) {
        
        String regex = "^[A-Za-z]+$";
        if(!nombre.matches(regex)){
            throw new RuntimeException(
            """
            
            EL NOMBRE DEL DEPARTAMENTO QUE DESEAS AGREGAR TIENE UN FORMATO INVALIDO 
            REVISA QUE NO TENGA NUMEROS NI ESPACIOS SOLO CARACTERES
            POR FAVOR VALIDELO Y VUELVA A INTENTARLO !!
            
            """);
        }
        
        this.nombre = nombre;
    }

    public void setGobernador(Gobernador gobernador) {
        this.gobernador = gobernador;
    }

    /*//////////////////////////////////////////////////*/

   
        
    
    /*---------------METODOS GETTERS----------------*/
    public String getNombre() {
        return nombre;
    }

    public Gobernador getGobernador() {
        return gobernador;
    }
    
    /*//////////////////////////////////////////////////*/

    
}
