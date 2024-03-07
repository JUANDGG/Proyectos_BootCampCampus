package model.dao;

import model.Mision;

import java.util.List;

import model.MisionNinja ;

public interface MisionNinjaDao {
    List<Mision> listaMisionesNinjaDisponibles(int idNinja);
    List<Mision> listarMisionesNinjaCompletadas(int idNinja);

    void asignarMisionNinja(MisionNinja misionNinja) ;
    void finalizarMisionNinja(int idMision ,int idNinja);


}
