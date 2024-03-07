package model.dao;

import model.Habilidad;
import model.Ninja;
import conexion.BDConnection;

import java.sql.*;
import java.util.*;

public class NinjaDaoImpl implements NinjaDao {

    private final Connection con;

    public NinjaDaoImpl() {
        this.con = BDConnection.MySQLConnection();
    }

    @Override
    public List<Ninja> listarTodos() {
        List<Ninja> ninjaLista = new ArrayList<>();
        final String CONSULTA = """
            SELECT * FROM ninja where estado_ninja = 1 ;
        """;

        try (Connection con = BDConnection.MySQLConnection();
                PreparedStatement preparedStatement = con.prepareStatement(CONSULTA)) {

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Ninja ninja = new Ninja(rs.getString("nombre"),rs.getString("rango"),rs.getString("aldea"));
                    ninjaLista.add(ninja);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ninjaLista;
    }

    @Override
    public void crearNinja(Ninja ninja) {
        final String INSERCION = """
            INSERT INTO ninja (nombre,rango,aldea,estado_ninja) values(?,?,?,?);
        """;
        try (Connection con = BDConnection.MySQLConnection()) {
            try (PreparedStatement preparedStatement = con.prepareStatement(INSERCION)) {
                preparedStatement.setString(1, ninja.getNombre());
                preparedStatement.setString(2, ninja.getRango());
                preparedStatement.setString(3, ninja.getAldea());
                preparedStatement.setBoolean(4, true);
                preparedStatement.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void modificarNinja(int idNinja , String nombreNinja) {
        final String MODIFICACION = """
            UPDATE ninja SET nombre = ? WHERE id = ?
        """;
        try (Connection con = BDConnection.MySQLConnection()) {
            boolean buscarNinjaId = buscarNinja(idNinja);

            try (PreparedStatement preparedStatement = con.prepareStatement(MODIFICACION)) {
                preparedStatement.setString(1, nombreNinja);
                preparedStatement.setInt(2, idNinja);
                preparedStatement.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void eliminarNinja(int idNinja) {
        final String DESACTIVACION = """
            UPDATE ninja SET estado_ninja = false WHERE id = ?
        """;

        try (Connection con = BDConnection.MySQLConnection()) {
            boolean buscarNinjaId = buscarNinja(idNinja);
            try (PreparedStatement preparedStatement = con.prepareStatement(DESACTIVACION)) {
                preparedStatement.setInt(1, idNinja);
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public boolean buscarNinja(int idNinja) {
        final String CONSULTA = """
           SELECT * FROM ninja where id = ?
        """;
        try (PreparedStatement preparedStatement = con.prepareStatement(CONSULTA)) {
            preparedStatement.setInt(1, idNinja);
            ResultSet rs = preparedStatement.executeQuery();
            if (!rs.next()) {
                throw new Exception("Error: el ninja no a sido creado a un");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

        return true;

    }

    // falta implementar este metodo
    @Override
    public void asignarHabilidad(Habilidad habilidad) {

    }
}
