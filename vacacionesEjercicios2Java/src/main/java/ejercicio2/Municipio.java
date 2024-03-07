
package ejercicio2;

public class Municipio {
    
    /*-------------------------ATRIBUTOS--------------------------------*/
    private String nombre;
    private int poblacion;
    private double area;

    /*////////////////////////////////////////////////////////////////////////*/
    
    /*-------------------------CONSTRUCTORES--------------------------------*/
    
    public Municipio(String nombre, int poblacion, double area) {
        this.setNombre(nombre);
        this.setPoblacion(poblacion);
        this.setArea(area);
    }

    
    /*////////////////////////////////////////////////////////////////////////*/
    
    /*-------------------------METODOS SETTERS--------------------------------*/
    
   
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

    public void setPoblacion(int poblacion) {
        this.poblacion = poblacion;
    }

    public void setArea(double area) {
        this.area = area;
    }
    /*/////////////////////////////////////////////////////////////////////////*/
    
    
    
    /*-------------------------METODOS GETTERS--------------------------------*/
     public String getNombre() {
        return nombre;
    }

    public int getPoblacion() {
        return poblacion;
    }

    public double getArea() {
        return area;
    }
    
    /*/////////////////////////////////////////////////////////////////////////*/
    
    
    /*-------------------------TO STRING--------------------------------*/
    
    @Override
    public String toString() {
        return
            """
            nombre municipio : """ +this.getNombre()+ """
                                            
            poblacion municipio : """ +this.getPoblacion()+ """
              
            area municipio : """ +this.getArea()+ """
            """;
    }
    
    /*/////////////////////////////////////////////////////////////////////////*/
}
