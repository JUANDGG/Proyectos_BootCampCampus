
package ejercicio2;

import java.util.ArrayList;
import java.util.Map;


public class GestionDpto implements OperacionesDptos {
    
    /*------------------------------ATRIBUTOS--------------------------------*/

    private Datos mapaDatos;

    /*/////////////////////////////////////////////////////////////////////////////*/
    
    
    /*------------------------------CONSTRUCTORES--------------------------------*/
    public GestionDpto (Datos mapaDatos){
        this.setMapaDatos(mapaDatos);
    }
    
    /*/////////////////////////////////////////////////////////////////////////////*/
    
    
    /*------------------------------METODOS SETTERS--------------------------------*/

    public void setMapaDatos(Datos mapaDatos) {
        this.mapaDatos = mapaDatos;
    }
    
    /*/////////////////////////////////////////////////////////////////////////////*/
    
    /*------------------------------METODOS GETTERS--------------------------------*/
    
    public Datos getMapaDatos() {
        return mapaDatos;
    }
    
    /*/////////////////////////////////////////////////////////////////////////////*/
    
    
    /*------------------------------FUNCIONALIDAD--------------------------------*/
    
    
    // metodo para buscar dpto
    @Override
    public  Departamento buscarDpto(String nombreDpto) {
        Map<Departamento, ArrayList<Municipio>> datosDpto = mapaDatos.getDatosDpto();
        for (Map.Entry<Departamento,ArrayList<Municipio>> entradas : datosDpto.entrySet()) {
            Departamento dpto = entradas.getKey();
            if (dpto.getNombre().equalsIgnoreCase(nombreDpto)) {
                return dpto;
            }
        }

        return null;  
    }

    // metodo para agregar un departamento
    @Override
    public  void  agregarDepartamento(Departamento d){
        Departamento dpto = this.buscarDpto(d.getNombre());
        Map<Departamento, ArrayList<Municipio>> datosDpto = mapaDatos.getDatosDpto();
        if(dpto instanceof Departamento ){
            throw new RuntimeException("no se puedo agregar el departamento por que ya hay uno agregado !!");
        }
        
        datosDpto.put(d, new ArrayList<>());
  
    }
    
    
    
    
    // metodo para listar los datos de un gobernador en especifico de un departamento
    @Override
    public String listarGobernador (String nombreDepartamento){
        Departamento dpto = this.buscarDpto(nombreDepartamento);
        if(dpto == null){
            throw new RuntimeException(
            """

            no se puede listar el gobernador por que el dpto no existe !!

            """);
        }
        
        
        String datosGobernador = dpto.getGobernador().toString();
        
        return datosGobernador ;
        
        
    }
    
    
    // metodo para calcular censo de personas en un departamento
    @Override
    public int calcularCenso(String nombreDepartamento){
        Departamento dpto = this.buscarDpto(nombreDepartamento);
        int cantidadPoblacion = 0;
        ArrayList <Municipio> municipios =  mapaDatos.getDatosDpto().get(dpto);
        
        if(dpto == null){
            throw new RuntimeException(
            """
            
            no se puede calcular el censo del departamento por que no existe el departamento!!
            
            """);
        }
        
        else if(municipios.size()==0){
            throw new RuntimeException(
            """
            
            no se puede calcular  el censo de personas de los municipio
            por que no hay ninguno municipio agrega uno e intentalo de nuevo!!
            
            """);
        }
        
        for(Municipio m : municipios){
            cantidadPoblacion += m.getPoblacion();
        }
        
        return cantidadPoblacion ;
        
    }
    
    // metodo para calcular el area total de un departamento por medio de cada uno de los municipios
    @Override
    public double calcularArea(String nombreDepartamento){
       Departamento dpto = this.buscarDpto(nombreDepartamento);
       int areaDpto = 0;
       ArrayList <Municipio> municipios =  mapaDatos.getDatosDpto().get(dpto);

       if(dpto == null){
           throw new RuntimeException(
            """ 
            
            no se puede calcular el area del departamento por que no existe el departamento!!
            
            """);
       }
       
        else if(municipios.size()==0){
            throw new RuntimeException(
            """
            
            no se puede calcular  el area total del departamento
             por que no hay ninguno municipio agrega uno e intentalo de nuevo!!
            

            """);
        }

       for(Municipio m : municipios){
           areaDpto += m.getArea();
       }

       return areaDpto ;
   }
    
     
    /*/////////////////////////////////////////////////////////////////////////////*/
    
    
}
