
package ejercicio2;

import java.util.ArrayList;
import java.util.Map;


public interface OperacionesMuncps {
    Map<Departamento,Integer> buscarMun(String nombreMunicipio);
    void agregarMunc(String nombreDpto, Municipio m);
    ArrayList<String> listarMunicipios (String nombreDepartamento);
    public void eliminarMunicipio(String nombreDepartamento , String nombreMunicipio);
}
