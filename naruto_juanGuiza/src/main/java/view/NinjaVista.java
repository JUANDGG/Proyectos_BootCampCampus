package view;




import java.util.Scanner;

import controller.ControladorNinja;

public class NinjaVista {

    private ControladorNinja controladorNinja;


    public NinjaVista() {
        this.controladorNinja = new ControladorNinja();
    }

    public void ejecucion() {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("********** vista ninjas **********");
            System.out.println();
            System.out.println("1. ver todos los ninjas");
            System.out.println("2. Añadir un ninja");
            System.out.println("3. modificar un ninja");
            System.out.println("4. eliminar un ninja");
            System.out.println("0. Exit");
            System.out.println();
            System.out.print("Ingrese una opcion: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            switch (choice) {
                case 1:
                    verTodosLosNinjas();
                    break;
                case 2:
                    anadirNinja(scanner);
                    break;
                case 3:
                    modificarNinja(scanner);
                    break;
                case 4:
                    eliminarNinja(scanner);
                    break;
                case 0:
                    System.out.println("Saliendo...");
                    break;
                default:
                    System.out.println("Elección no válida. Inténtalo de nuevo!");
            }
        }
    }

    // listar
    public void verTodosLosNinjas() {
        System.out.println();
        System.out.println("********** Todos los ninjas **********");
        controladorNinja.mostrarNinjas();
        System.out.println();
    }

    // añadir
    public void anadirNinja(Scanner scanner) {
        System.out.println();
        System.out.print("\nIngrese el nombre del ninja: ");
        String nombreNinja = scanner.nextLine();
        System.out.println();
        System.out.print("\nIngrese el rango del ninja ");
        String rangoNinja = scanner.nextLine();
        System.out.println();
        System.out.print("\nIngrese la aldea del ninja: ");
        String aldeaNinja = scanner.nextLine();
        System.out.println();
        controladorNinja.crearNinja(nombreNinja,rangoNinja,aldeaNinja);
        System.out.println("Ninja agregado exitosamente.\n");
        System.out.println();
    }
    

    // modificar
    
    public void modificarNinja(Scanner scanner) {
        System.out.println();
        System.out.print("\nIngrese el id del ninja a modificar : ");
        int idNinja = scanner.nextInt();
        scanner.nextLine();
        System.out.println();
        System.out.print("\nIngrese el nuevo nombre del ninja  : ");
        String nuevoNombreNinja = scanner.nextLine();
        System.out.println();
        controladorNinja.modificarNinja(idNinja,nuevoNombreNinja);
        System.out.println("Ninja modificado exitosamente.\n");
        System.out.println();
    }

    
    // eliminar
    public void eliminarNinja(Scanner scanner) {
        System.out.println();
        System.out.print("\nIngrese el id del ninja a eliminar : ");
        
        int idNinja = scanner.nextInt();
        
        controladorNinja.eliminarNinja(idNinja);
        
        System.out.println("Ninja Eliminado exitosamente.\n");
        System.out.println();
    }



}
