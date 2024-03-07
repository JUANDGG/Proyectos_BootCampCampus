package model.dao;

import conexion.BDConnection;
import model.Mision;
import model.MisionNinja;
import conexion.BDConnection;
import java.sql.Connection;
import java.util.List;

public class MisionNinjaDaoImpl implements  MisionNinjaDao {


    private final Connection con;

    public MisionNinjaDaoImpl(Connection con) {
        this.con = BDConnection.MySQLConnection();
    }


    @Override
    public List<Mision> listaMisionesNinjaDisponibles(int idNinja) {
        return null;
    }

    @Override
    public List<Mision> listarMisionesNinjaCompletadas(int idNinja) {
        return null;
    }

    @Override
    public void asignarMisionNinja(MisionNinja misionNinja) {

    }

    @Override
    public void finalizarMisionNinja(int idMision, int idNinja) {

    }
}
