package ejercicio1;

import java.util.ArrayList;
import ejercicio1.Categorias;

public class GestionCategorias implements OperacionesCategorias {
        private ArrayList<Categorias> datosCategoria  = new ArrayList<>();
            
        {
                datosCategoria.add(new Categorias("Computadores"));
                datosCategoria.add(new Categorias("Celulares"));
                datosCategoria.add(new Categorias("Electrodomésticos"));
                datosCategoria.add(new Categorias("Tv"));
                datosCategoria.add(new Categorias("Accesorios"));
                datosCategoria.add(new Categorias("Audio y video"));
        }
        
      
        
         @Override 
        public int buscar(String nombreCategoria) { 
               for (int i = 0; i < datosCategoria.size(); i++) {
                String nombreCategoriasExiste = datosCategoria.get(i).getNombre();
                if (nombreCategoria.toLowerCase().equals(nombreCategoriasExiste.toLowerCase())) {
                    return i; 
                }
            }
            return -1; 
        }
    
        @Override 
        public void agregar(Categorias c) {
                String nombreCategoria  = c.getNombre().toLowerCase();
                int   metodoBuscar = this.buscar(nombreCategoria);
                if(metodoBuscar >-1){
                        throw new RuntimeException("no se puedo agregar la categoria por ya hay una agregada !!");
                }
                datosCategoria.add(c) ;
        }

        @Override
        public void eliminar(String nombreCategoria) {
            int   pocicionCategoria= this.buscar(nombreCategoria);
            if(pocicionCategoria <= -1){
                    throw new RuntimeException("no se puede eliminar la categoria por que no se encuentra !!");
            }
            datosCategoria.remove(pocicionCategoria);
        }

        public ArrayList<Categorias> getDatosCategoria() {
            return datosCategoria;
        }
    
}
