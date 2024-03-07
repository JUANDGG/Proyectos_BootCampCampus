
package com.mycompany.apuntes;

import java.awt.Color;
import javax.swing.*;



public class Interfaz  extends JFrame {
          public Interfaz() {
            // Establecer el título del frame
            super.setTitle("funteerr guiza");

            // Establecer el tamaño del frame
            super.setSize(800, 800);

            // Establecer el color de fondo del frame
            super.getContentPane().setBackground(Color.white);

            // Establecer el comportamiento al cerrar el frame
            super.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

            // Hacer visible el frame
            super.setVisible(true);
            
            super.setLocationRelativeTo(null);
           new JTextField(20);
            
        }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new Interfaz();
        });
    }
            

}
