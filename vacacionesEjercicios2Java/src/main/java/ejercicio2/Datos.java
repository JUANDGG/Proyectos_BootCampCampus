
package ejercicio2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class Datos {
    private Map<Departamento, ArrayList<Municipio>> datosDpto = new HashMap<>();

    
    public Map<Departamento, ArrayList<Municipio>> getDatosDpto() {
        return this.datosDpto;
    }


}
