package view;

import controller.ControladorMision;
import java.util.Scanner;

public class MisionVista {
    private ControladorMision controladorMision;


    public MisionVista() {
        this.controladorMision = new ControladorMision();
    }

    public void ejecucion() {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("********** vista misiones **********");
            System.out.println();
            System.out.println("1. ver todos las misiones");
            System.out.println("2. Añadir una mision");
            System.out.println("3. modificar una mision");
            System.out.println("4. eliminar una mision");
            System.out.println("0. Exit");
            System.out.println();
            System.out.print("Ingrese una opcion: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            switch (choice) {
                case 1:
                    verTodasLasMisiones();
                    break;
                case 2:
                    anadirMision(scanner);
                    break;
                case 3:
                    modificarMision(scanner);
                    break;
                case 4:
                    eliminarMision(scanner);
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
    public void verTodasLasMisiones() {
        System.out.println();
        System.out.println("********** Todos las misiones **********");
        controladorMision.mostrarMisiones();
        System.out.println();
    }

    // añadir
    public void anadirMision(Scanner scanner) {
        System.out.println();
        System.out.print("\nIngrese la descripcion de la mision: ");
        String nombreMision = scanner.nextLine();
        System.out.println();
        System.out.print("\nIngrese el recompenza de la mision ");
        String recompensaMision = scanner.nextLine();
        System.out.println();
        System.out.print("\nIngrese el rango de la mision ");
        String rangoMision = scanner.nextLine();
        System.out.println();
        controladorMision.crearMision(nombreMision,recompensaMision,rangoMision);
        System.out.println("mision agregada exitosamente.\n");
        System.out.println();
    }


    // modificar

    public void modificarMision(Scanner scanner) {
        System.out.println();
        System.out.print("\nIngrese el id de la mision a modificar : ");
        int idMision = scanner.nextInt();
        scanner.nextLine();
        System.out.println();
        System.out.print("\nIngrese la nueva descripcion de la mision  : ");
        String nuevodescMision = scanner.nextLine();
        System.out.println();
        controladorMision.modificarMision(idMision,nuevodescMision);
        System.out.println("mision modificado exitosamente.\n");
        System.out.println();
    }


    // eliminar
    public void eliminarMision(Scanner scanner) {
        System.out.println();
        System.out.print("\nIngrese el id de la mision a eliminar : ");

        int idMision = scanner.nextInt();

        controladorMision.eliminarNinja(idMision);

        System.out.println("Mision eliminada exitosamente.\n");
        System.out.println();
    }




}
