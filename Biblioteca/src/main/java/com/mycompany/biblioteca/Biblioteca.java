
package com.mycompany.biblioteca;

import java.util.ArrayList;
import java.util.List;


public class Biblioteca implements OpBiblioteca {

        private int id   ;
        private String nombreBiblioteca ;
        private List<Recurso> recursosDis ;
        
        
        // busqueda por id de recurso
        
        @Override
        public int buscarRecurso(int idRecurso) {
                 int recursoIdAbuscar = idRecurso ;
                 
                 
                  for (int i =0; i <recursosDis.size() ; i++) {
                            int recursosId = recursosDis.get(i).getId();
                            if(recursoIdAbuscar == recursosId) return i ;
                  }
                  
                  
                  return  -1 ;
                 
                
        }  
        
        // busqueda por titulo del recurso
        @Override
        public List<Recurso> buscarRecurso(String titulo) {
                   String bTitulo = titulo ;
            
                   List<Recurso> recursoBuscado = new ArrayList<> ();
                
            
                  for( Recurso r :recursosDis) {
                            String tituloArticulo = r.getTitulo() ;
                            if(tituloArticulo.equalsIgnoreCase(bTitulo))recursoBuscado.add(r);
                  }
                  
                  return recursoBuscado ;
        }

          // metodo para agregar recurso  
    
        @Override
        public void aggRecurso(Recurso recurso) {
                  int recursoIdAgg = recurso.getId();
                  int resBusRecur = buscarRecurso(recursoIdAgg);
                  
                  if(resBusRecur > -1){
                            throw new RuntimeException("no se puedo agregar el recurso porque ya se encuentra agregado !!");
                  }
                  
                  recursosDis.add(recurso);
        }
        
        // metodo para prestar recurso

        @Override
        public void prestarRecurso(int id) {
                   int recursoAprestar = id ;
                   int resBusRecur = buscarRecurso(recursoAprestar);

                   if(resBusRecur <=-1){
                            throw new RuntimeException("no se puede prestar un recurso que no existe !!");
                  }
                   
                   recursosDis.get(recursoAprestar).setDisponible(false);  
        }
}
