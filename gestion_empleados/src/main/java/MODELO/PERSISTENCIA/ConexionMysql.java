package MODELO.PERSISTENCIA;

//import java.sql.Connection;

public abstract class ConexionMysql  {

    // 1 -configurar el log de data para conectame ala base de datos

    static String [] dConex = ConfigConexion.configuracionBd
    ("mysql.url","mysql.usuario","mysql.contrasena");


    public static void main(String[] args) {

        System.out.println(dConex[1]);
    }

}


