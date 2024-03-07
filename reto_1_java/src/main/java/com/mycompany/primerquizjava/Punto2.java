
package com.mycompany.primerquizjava;

import java.util.Scanner;


import java.util.Scanner;

public class Punto2 {
    




     private static boolean vMayuscula(String contrasena) {
        for (char caracter : contrasena.toCharArray()) if (caracter >= 'A' && caracter <= 'Z') return true;
        return false;
    }

    private static boolean vMinuscula(String contrasena) {
        for (char caracter : contrasena.toCharArray()) if (caracter >= 'a' && caracter <= 'z') return true;
        return false;
    }

    private static boolean vNumero(String contrasena) {
        for (char caracter : contrasena.toCharArray()) if (caracter >= '0' && caracter <= '9') return true;
        return false;
    }

    private static boolean vCespecial(String contrasena) {
        String caracteresEspeciales = "!@#$%^&*";
        for (char caracter : contrasena.toCharArray()) if (caracteresEspeciales.contains(String.valueOf(caracter))) return true;
        return false;
    }
    
    
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingrese la contraseña a validar:");
        String contrasena = scanner.nextLine();

        // Verificar la contraseña
        if (contrasena.length() < 8 ||
            !vMayuscula(contrasena) ||
            !vMinuscula(contrasena) ||
            !vNumero(contrasena) ||
            !vCespecial(contrasena)) {

            System.out.println("la contrasena esta mal rectifica e intenta nuevamente.");
        } else {
            System.out.println("La contraseña es válida.");
        }
    }

   
}

    
    

