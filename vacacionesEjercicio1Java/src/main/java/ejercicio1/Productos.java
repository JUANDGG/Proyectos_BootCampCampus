
package ejercicio1;

public class Productos {
        
        /*----------------------------------------ATRIBUTOS------------------------------------------------*/
        private String serialReferencia ;
        private String nombre  ;
        private Float precio;
        private String categoria ;
        private int cantidad ;

   
        
        
        /*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
        
        /*----------------------------------------CONSTRUCTORES------------------------------------------------*/
        public Productos( String serialReferencia ,  String nombre ,Float precio ,  String categoria,int cantidad) {
                this.setNumeroReferencia(serialReferencia);
                this.setNombre(nombre);
                this.setPrecio(precio);
                this.setCategoria(categoria);
                this.setCantidad(cantidad);
        }
        
        /*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
        
        /*----------------------------------------METODOS SETTERS--------------------------------------------*/
        
        
        
        public void setNumeroReferencia(String serialReferencia) {
                this.serialReferencia = serialReferencia;
        }

        public void setNombre(String nombre) {
                this.nombre = nombre;
        }

        public void setPrecio(Float precio) {
                this.precio = precio;
        }

        public void setCategoria(String categoria) {
            this.categoria = categoria;
        }
        
        
        public void setCantidad(int cantidad) {
            this.cantidad = cantidad;
        }

    
        
        /*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
        
        /*----------------------------------------METODOS GETTERS--------------------------------------------*/       

        public String getSerialReferencia() {
                return this.serialReferencia;
        }

        public String getNombre() {
                 return this.nombre;
        }

        public Float getPrecio() {
                return this.precio;
        }

      
        public String getCategoria() {
                return this.categoria;
        }
        
        public int getCantidad() {
            return cantidad;
        }
        
        
        /*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
        
         /*----------------------------------------METODO TO STRING()--------------------------------------------*/       
        @Override
        public String toString() {
            return 
                    "serial del producto : " + this.getSerialReferencia()  + "\n"+ 
                    "nombre del producto : " + this.getNombre() + "\n" + 
                    "precio del producto :" + this.getPrecio() +"\n"+
                    "categoria del producto :" + this.getCategoria() + "\n" +
                    "cantidad del producto : " + this.getCantidad();
        }
        
        /*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
}
