package conexion;

import java.sql.*;

public abstract class BDConnection {
    private static String url = "";
    private static String user = "";
    private static String password = "";
    public static Connection con = null;

    public static Connection MySQLConnection() {
        url = "jdbc:mysql://192.168.110.6:3306/naruto_juanGuiza";
        user = "juan";
        password = "Juan123";
        return getConnection(url, user, password);
    }

    private static Connection getConnection(String url, String user, String password) {
        try {
            // Realizar la conexion
            con = DriverManager.getConnection(url, user, password);
            if (con != null) {
                DatabaseMetaData meta = con.getMetaData();
                System.out.println("Database connected " + meta.getDriverName());
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return con;
    }

}







