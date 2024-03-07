package MODELO.PERSISTENCIA;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;


public abstract class Conexion {

    private  static  Connection con = null  ;
    private  static  Connection traerConexion(String url , String usuario, String contrasena){
            try {
                con = DriverManager.getConnection(url,usuario,contrasena);

                if(con ==null){
                    throw new RuntimeException("no se pudo conectar la base de datos");
                }

                DatabaseMetaData dMeta = con.getMetaData();
                System.out.printf("base de datos conectada " + dMeta.getDriverName() );

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

            return  con ;

    }

}
