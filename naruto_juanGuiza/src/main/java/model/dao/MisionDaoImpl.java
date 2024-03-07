package model.dao;

import conexion.BDConnection;
import model.Mision;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MisionDaoImpl implements  MisionDao {
    private final Connection con;

    public MisionDaoImpl() {
        this.con = BDConnection.MySQLConnection();
    }

    @Override
    public List<Mision> listarTodos() {
        List<Mision> misionLista = new ArrayList<>();
        final String CONSULTA = """
            SELECT * FROM mision where estadoMision = 1 
        """;

        try (Connection con = BDConnection.MySQLConnection();
             PreparedStatement preparedStatement = con.prepareStatement(CONSULTA)) {
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Mision mision = new Mision(rs.getString("descripcion"),rs.getString("recompensa"),rs.getString("rango"));
                    misionLista.add(mision);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return misionLista;
    }

    @Override
    public void crearMision(Mision mision) {
        final String INSERCION = """
            INSERT INTO mision (descripcion,recompensa,rango,estadoMision) values(?,?,?,?);
        """;
        try (Connection con = BDConnection.MySQLConnection()) {
            try (PreparedStatement preparedStatement = con.prepareStatement(INSERCION)) {
                preparedStatement.setString(1, mision.getDescripcion());
                preparedStatement.setString(2, mision.getRecompensa());
                preparedStatement.setString(3, mision.getRango());
                preparedStatement.setBoolean(4, true);
                preparedStatement.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void modificarMision(int idMision ,String descripcion) {
        final String MODIFICACION = """
            UPDATE mision SET descripcion = ? WHERE id = ?
        """;
        try (Connection con = BDConnection.MySQLConnection()) {
            boolean buscarMision = buscarMision(idMision);

            try (PreparedStatement preparedStatement = con.prepareStatement(MODIFICACION)) {
                preparedStatement.setString(1, descripcion);
                preparedStatement.setInt(2, idMision);
                preparedStatement.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public boolean buscarMision(int idMision) {
        final String CONSULTA = """
           SELECT * FROM mision where id = ?
        """;
        try (PreparedStatement preparedStatement = con.prepareStatement(CONSULTA)) {
            preparedStatement.setInt(1, idMision);
            ResultSet rs = preparedStatement.executeQuery();
            if (!rs.next()) {
                throw new Exception("Error: la mision no a sido creado a un");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

        return true;
    }

    @Override
    public void eliminarMision(int idMision) {
        final String DESACTIVACION = """
            UPDATE mision SET estadoMision = false WHERE id = ?
        """;

        try (Connection con = BDConnection.MySQLConnection()) {
            boolean buscarNinjaId = buscarMision(idMision);
            try (PreparedStatement preparedStatement = con.prepareStatement(DESACTIVACION)) {
                preparedStatement.setInt(1, idMision);
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
