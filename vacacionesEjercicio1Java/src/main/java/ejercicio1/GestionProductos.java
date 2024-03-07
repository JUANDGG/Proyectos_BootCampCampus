package ejercicio1;


import java.util.*;
import ejercicio1.GestionCategorias ;
import java.util.stream.Collectors;


public class GestionProductos implements OperacionesProductos{
        private ArrayList<Productos> datosProducto  = new ArrayList<>();
        GestionCategorias gestionCategorias = new GestionCategorias();
        
        
        
        @Override
        public int buscar(String serialReferencia) {
                for (int i = 0; i <datosProducto.size(); i++) {
                String serialReferenciaExist = datosProducto.get(i).getSerialReferencia();
                if (serialReferencia.toLowerCase().equals(serialReferenciaExist.toLowerCase())) {
                    return i;  // Devuelve la posición si encuentra la categoría
                }
            }
            return -1; // Devuelve -1 si no se encuentra la categoría
        }

        @Override
        public String listar(String serialReferencia) {
                int metodoBuscar = this.buscar(serialReferencia);
                if(metodoBuscar <= -1) {
                        throw new RuntimeException("no se puede listar un producto que no se encuentra  !!");
                }
                return datosProducto.get(metodoBuscar).toString();
        }

        @Override
        public void agregar(Productos p) {
                int metodoBuscar = this.buscar(p.getSerialReferencia());
                // busco si la categoria q quiere asociar al producto este en categoria
                int metodoBuscarCategoria = new GestionCategorias().buscar(p.getCategoria());
                if(metodoBuscar >-1) {
                        throw new RuntimeException("no se puede agregar un producto que ya se encuentra agregado !!");
                }
                
                if(metodoBuscarCategoria  <=-1) {
                        throw new RuntimeException("la categoria a asociar no se encuentra  por favor intentelo de nuevo !!");
                }
                datosProducto.add(p);
        }

        @Override
        public void eliminar(String serialReferencia) {
             int metodoBuscar= this.buscar(serialReferencia);
            if(metodoBuscar <= -1){
                    throw new RuntimeException("no se puede eliminar la categoria por que no se encuentra !!");
            }
            datosProducto.remove(metodoBuscar);
        }
        
        
        @Override
        public ArrayList<String> flitrar(String nombreCategoria) {
            int metodoBuscarCategoria = new GestionCategorias().buscar(nombreCategoria);
             if(metodoBuscarCategoria  <=-1) {
                throw new RuntimeException("Cero coincidencias con la categoria" +nombreCategoria+"!!");
            }
             
            String nombreCategoriaEncontrada = gestionCategorias.getDatosCategoria().get(metodoBuscarCategoria).getNombre();
 
            
            ArrayList<Productos> flitroCategoria = datosProducto.stream()
            .filter(producto -> producto.getCategoria().equalsIgnoreCase(nombreCategoriaEncontrada))
            .collect(Collectors.toCollection(ArrayList::new));
             
            ArrayList<String>datosProductosFiltroCategoria = new ArrayList<>();
            
            for(Productos p :flitroCategoria){
                datosProductosFiltroCategoria.add(p.toString());
            }
            
            return datosProductosFiltroCategoria;
          
        }
        
        
        
        /*------------------------------GETTER--------------------------------*/
        public ArrayList<Productos> getDatosProducto() {
            return this.datosProducto;
        }
        
        /*////////////////////////////////////////////////////////////////////*/

    
        

    
}
