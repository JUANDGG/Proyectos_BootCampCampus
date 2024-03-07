package ejercicio1;

import java.util.ArrayList;

public interface OperacionesCategorias {
    
        int buscar(String nombreCategoria);
        void agregar(Categorias c ) ;
        void eliminar(String nombreCategoria);
}
