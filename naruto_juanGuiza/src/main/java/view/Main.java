package view;

import model.Mision;
import model.Ninja;

import java.util.Scanner;

public class Main {

    public void ejecucion() {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("********** vista misiones **********");
            System.out.println();
            // sirve
            System.out.println("1. Ninjas");
            // sirve
            System.out.println("2. Misiones");
            // falta implementaciones
            System.out.println("3.Gestiones de mision");
            System.out.println();
            System.out.print("Ingrese una opcion: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            switch (choice) {
                case 1:
                    new NinjaVista().ejecucion();
                    break;
                case 2:
                    new MisionVista().ejecucion();
                    break;
                case 0:
                    System.out.println("Saliendo...");
                    System.exit(0);
                default:
                    System.out.println("Elección no válida. Inténtalo de nuevo!");
            }
        }
    }

    public static void main(String[] args) {
        Main main = new Main() ;
        main.ejecucion();

    }

}
