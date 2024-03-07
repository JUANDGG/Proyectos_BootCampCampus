package ejercicio1;

import java.util.Scanner;
import ejercicio1.GestionCategorias;
import ejercicio1.Categorias;
import ejercicio1.GestionProductos;
import ejercicio1.Productos ;
import java.util.ArrayList;

public class Menus {
    private Scanner scanner = new Scanner(System.in);
    private GestionCategorias gestionCategoria = new GestionCategorias();
    private GestionProductos gestionProductos = new GestionProductos();
    /*------------------------------MENU PRINCIPAL----------------------------------*/

    public void menuPrincipal() {
        while (true) {
            System.out.println("""
                    1 - Categorias
                    2 - Productos
                    3 - Salir
                    """);
            System.out.print("\nIngresa una opcion: ");
            int op = scanner.nextInt();
            scanner.nextLine();

            if (op == 3) {
                scanner.close();
                break;
            }

            if (op == 1) {
                this.menuCategoria();
            }
            
            if(op == 2){
                this.menuProductos();
            }
        }
    }

    /*
     * /////////////////////////////////////////////////////////////////////////////
     * ////////////////////////////////////////
     */

    /*------------------------------MENU CATEGORIAS----------------------------------*/

    public void menuCategoria() {
        while (true) {
            System.out.println("""
                    1 - Agregar Categoria
                    2 - Eliminar Categoria
                    3 - Salir
                    """);
            System.out.print("\nIngresa una opcion : ");
            int op = scanner.nextInt();
            scanner.nextLine();

            if (op == 3) {
                System.out.println("\n has salido del menu de categorias \n");
                break;
            }

            if (op == 1) {
                System.out.print("Ingresa el nombre de la categoria a agregar : ");
                String categoria = scanner.nextLine();
                try {
                    gestionCategoria.agregar(new Categorias(categoria));
                    System.out.println("\nCategoria agregada exitosamente\n");
                } catch (RuntimeException e) {
                    System.out.println("\n" + e.getMessage() + "\n");
                }
            }

            if (op == 2) {
                System.out.print("\nIngresa el nombre de la categoria a eliminar : ");
                String categoria = scanner.nextLine();
                try {
                    gestionCategoria.eliminar(categoria);
                    System.out.println("\nCategoria eliminada exitosamente\n");
                } catch (RuntimeException e) {
                    System.out.println("\n" + e.getMessage() + "\n");
                }
            }
        }
    }

    /*
     * /////////////////////////////////////////////////////////////////////////////
     * ////////////////////////////////////////
     */

    /*------------------------------MENU PRODUCTOS----------------------------------*/
    
      public void menuProductos () {
         while (true) {
                System.out.println("""             
                1 - Agregar Producto
                2 - Eliminar Producto
                3 - Flitrar Productos
                4 - Listar Producto
                5 - Salir
               """);
                
                System.out.print("\nIngresa una opcion : ");
                int op = scanner.nextInt();
                scanner.nextLine();
                
                if(op ==5){
                    break ;
                }
                
                if(op ==1){
                    // serial del producto
                    System.out.print("\n\nIngresa el serial del producto a agregar : ");
                    String serial = scanner.nextLine();
                    // nombre del producto
                    System.out.print("\nIngresa el nombre del producto : ");
                    String nombre = scanner.nextLine();
                    // precio
                    System.out.print("\nIngresa el precio del producto : ");
                    float precio = scanner.nextFloat();
                    scanner.nextLine();

                    // categoria
                    System.out.print("\nIngresa el nombre de  la categoria a asociar  el  producto : ");
                    String categoria =   scanner.nextLine() ;
                    scanner.nextInt();
                    
                    // cantidad 
                    System.out.print("\nIngresa la cantidad del producto : ");
                    int cantidad =   scanner.nextInt() ;
                    

                    try {
                            gestionProductos.agregar(new Productos(serial,nombre,precio,categoria,cantidad));
                            System.out.println("\nProducto agregado exitosamente\n");

                    }catch (RuntimeException e){
                             System.out.println("\n" + e.getMessage() + "\n");
                    }        
                }
                
                if(op ==2){
                   System.out.print("\nIngresa el serial del producto a eliminar : ");
                    String productos = scanner.nextLine();
                    try {
                        gestionProductos.eliminar(productos);
                        System.out.println("\nProducto eliminado exitosamente\n");
                    } catch (RuntimeException e) {
                        System.out.println("\n" + e.getMessage() + "\n");
                    }
                }
                
                
                if(op ==3){
                    System.out.print("\nIngresa de la categoria del producto a flitrar : ");
                    String categoriaProductos = scanner.nextLine();
                    try {
                        ArrayList<String> flitroProductos  =gestionProductos.flitrar(categoriaProductos);
                        
                        for(String p : flitroProductos){
                            System.out.println("\n"+p+"\n");
                        }
                        
                        
                    } catch (RuntimeException e) {
                        System.out.println("\n" + e.getMessage() + "\n");
                    }
                }
                
                if(op == 4) {
                    System.out.print("\nIngresa el serial del producto a listar : ");
                    String productos = scanner.nextLine();
                    try {
                        String listado  =gestionProductos.listar(productos);
                        System.out.println("\n"+listado+"\n");
                    } catch (RuntimeException e) {
                        System.out.println("\n" + e.getMessage() + "\n");
                    }
                }
                
         }
        
     
      } ;
     
    /*
     * /////////////////////////////////////////////////////////////////////////////
     * ////////////////////////////////////////
     */
}
