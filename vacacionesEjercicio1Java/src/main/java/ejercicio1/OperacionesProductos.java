
package ejercicio1;

import java.util.ArrayList;


public interface OperacionesProductos {
        int buscar(String serialReferencia );
        String listar(String serialReferencia);
        void agregar(Productos p ) ;
        void eliminar(String serialReferencia);
        ArrayList<String> flitrar(String nombreCategoria);
        
}
