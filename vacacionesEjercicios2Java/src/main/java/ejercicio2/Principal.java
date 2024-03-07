

package ejercicio2;


public class Principal {
    public static void main(String[] args) {
        // objecto compartido en el cual tiene un mapa al cual es la propiedad que hacedemos 
        
        /*
        dividi este programa asi por que es mucho mejor ya que cada clase tiene su responsabilidad
        y es mas escalable por ejemplo dividi departamento en 2 clases la primera se encarga de 
        getionar la data del departamento como tal  , la segunda se encarga de gestionar 
        todo lo que tenga que ver con el mismo en la base de datos local del programa la cual
        es un mapa que esta dentro de un objecto , podria esta misma ser estatica pero no lo quiero 
        asi por que quiero que sea propia del objecto y no de la clase , basicamente 
        hay dos objectos que interactuan con el objecto mapa compartido 
        
        el 1 es el que gestiona el departamento 
        el 2 es el que gestiona los municipios 
        
        */
        
        Datos mapaCompartido = new Datos();
        GestionDpto gestionDpto = new GestionDpto(mapaCompartido);
        GestionMunic gestionMunic = new GestionMunic(mapaCompartido, gestionDpto);

        
       
        Menus menus = new Menus(gestionDpto, gestionMunic);
        menus.menuPrincipal();
        System.out.println(mapaCompartido.getDatosDpto());
        
    }
}