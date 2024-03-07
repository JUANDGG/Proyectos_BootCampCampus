package MODELO.PERSISTENCIA;

import java.io.InputStream;
import java.util.Properties;

public abstract class ConfigConexion {

    public static String[] configuracionBd(String prop1Url, String prop2User, String prop3Pass) {
        String[] dConexion = new String[3];

        try (InputStream input = ConfigConexion.class.getClassLoader().getResourceAsStream("env.properties")) {
            if (input != null) {
                Properties prop = new Properties();
                prop.load(input);

                // Obtener valores de las propiedades
                String url = prop.getProperty(prop1Url);
                String usuario = prop.getProperty(prop2User);
                String contrasena = prop.getProperty(prop3Pass);

                // Almacenar los valores en el array
                dConexion[0] = url;
                dConexion[1] = usuario;
                dConexion[2] = contrasena;
            } else {
                System.out.println("El archivo env.properties no se pudo cargar.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dConexion;
    }
}
