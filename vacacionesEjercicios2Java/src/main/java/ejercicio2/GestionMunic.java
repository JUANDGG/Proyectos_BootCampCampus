
package ejercicio2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class GestionMunic implements OperacionesMuncps{
    
    
    /*----------------------------------------ATRIBUTOS COMPARTIDOS----------------------------------------*/

    private Datos mapaDatos;
    private GestionDpto gestionDpto;
    
     /*//////////////////////////////////////////////////////////////////////////////////////////////*/
 
    /*----------------------------------------CONSTRUCTORES----------------------------------------*/
    
    public GestionMunic (Datos datos, GestionDpto gestionDpto) {
        this.setMapaDatos(datos);
        this.setGestionDpto(gestionDpto);
                
    }
    
    /*//////////////////////////////////////////////////////////////////////////////////////////////*/

    
   
    /*----------------------------------------METODOS SETTERS----------------------------------------*/
    
    
    public void setMapaDatos(Datos mapaDatos) {
        this.mapaDatos = mapaDatos;

    }
    
    public void setGestionDpto(GestionDpto gestionDpto) {
        this.gestionDpto = gestionDpto;
    }

    /*/////////////////////////////////////////////////////////////////////////////////////////////////*/

    
    
    /*----------------------------------------METODOS GETTERS--------------------------------------*/
    public GestionDpto getGestionDpto() {
        return gestionDpto;
    }
    
    
    public Datos getMapaDatos() {
        return mapaDatos ;
    }

    
    /*/////////////////////////////////////////////////////////////////////////////////////////////////*/
    
    
    
    
    /*----------------------------------------FUNCIONALIDADES--------------------------------------*/
    
    // buscar municipios
    @Override
    public Map<Departamento,Integer> buscarMun(String nombreMunicipio) {
        Map<Departamento, ArrayList<Municipio>> datosDpto = mapaDatos.getDatosDpto();
        Map<Departamento, Integer> resultados = new HashMap<>();
        
        for (Map.Entry<Departamento,ArrayList<Municipio>> entradas : datosDpto.entrySet()) {
            ArrayList<Municipio> munc = entradas.getValue();
            Departamento dpto  =entradas.getKey();
            for(int i = 0 ; i< munc.size();i++){
                String nombreMunExiten = munc.get(i).getNombre();
                if(nombreMunicipio.equalsIgnoreCase(nombreMunExiten)){
                    resultados.put(dpto, i );
                           
                }
            }
        }
        
        return resultados ;
    }
    
    
    // agregar municipios
    @Override
    public void agregarMunc(String nombreDpto, Municipio m) {
        
        // mapa compartido 
        
        Map<Departamento, ArrayList<Municipio>> datosDpto = mapaDatos.getDatosDpto();

        
        // nombre municipio que se agregara al departamento
        String  nombreMunicipio = m.getNombre() ;
        String nombreDeparamento = nombreDpto ;
       
  
        // buscar  el departamento
        
        Departamento dpto =gestionDpto.buscarDpto(nombreDeparamento);
        Map<Departamento,Integer> mun = this.buscarMun(nombreMunicipio);
        
        
        // validar que el departamento al que va a asignar este
        if(!(dpto instanceof Departamento)){
            throw new RuntimeException("no se puede agregar el municipio al departamento por que no existe ese departamento");
        }
        
        
        // validar el muncipio
        
        for (Map.Entry<Departamento,Integer> entradas : mun.entrySet()) {
            Departamento departamento = entradas.getKey();
            if (departamento.getNombre().equalsIgnoreCase(nombreDeparamento)) {
                throw new RuntimeException("ya existe el municipio en el departamento !!");
            }
        }
        
        datosDpto.get(dpto).add(m);

    }
    
    
    
    // metodo para listas los municipios dentro de un departamento
    @Override
    public ArrayList<String> listarMunicipios (String nombreDepartamento){
        Departamento dpto = gestionDpto.buscarDpto(nombreDepartamento);
        ArrayList <Municipio> municipios =  mapaDatos.getDatosDpto().get(dpto);
        ArrayList <String> datosMunicipios = new ArrayList<>();
        
        if(dpto == null){
            throw new RuntimeException(
            """
            
             no se puede listar los municipios del departamento por que no existe el departamento!!
            
            """);
        }
        
        
        else if(municipios.size()==0){
            throw new RuntimeException(
            """
            
            no se pueden listar los municipios del departamento
            por que no hay ninguno agrega uno e intentalo de nuevo!!
            
            """);
        }
        
              
        for(Municipio m : municipios){
            datosMunicipios.add(m.toString());
        }
        
        return datosMunicipios ;
        
    }
    
    
   // este metodo elimina los muncipios
    @Override
    public void eliminarMunicipio(String nombreDepartamento , String nombreMunicipio){
        
        Map<Departamento, ArrayList<Municipio>> datosDpto = mapaDatos.getDatosDpto();
        Map<Departamento,Integer> mun = this.buscarMun(nombreMunicipio);
        
        Departamento dpto = gestionDpto.buscarDpto(nombreDepartamento);
        

        if(dpto == null){
            throw new RuntimeException(
            """
            
             NO SE PUEDE ELIMINAR NINGUN MUNICIPIO DE ESTE DEPARTAMENTO 
             PORQUE EL MISMO NO EXISTE
            !!
            
            """);
        }
        
        if(mun.size()==0){
            throw new RuntimeException(
            """
            
             EL MUNICIPIO QUE DESEAS ELIMINAR NO SE ENCUENTRA EN LA BASE DE DATOS
            !!
            
            """);
        
        }
        
        for (Map.Entry<Departamento,Integer> entradas : mun.entrySet()) {
            Departamento departamento = entradas.getKey();
            if (departamento.getNombre().equalsIgnoreCase(nombreDepartamento)) {
                ArrayList<Municipio> munDelete  = datosDpto.get(departamento);
                munDelete.remove(entradas.getValue().intValue());
            }
        }
            
    }
   
    
    /*/////////////////////////////////////////////////////////////////////////////////////////////////*/
    
  
}
