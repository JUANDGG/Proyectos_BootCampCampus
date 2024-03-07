package model.dao;

import model.Mision ;

import java.util.List;

public interface MisionDao {

    List<Mision> listarTodos() ;
    void  crearMision(Mision mision) ;
    void modificarMision(int idMision ,String descripcion);
    boolean buscarMision(int idMision) ;
    void eliminarMision(int idMision);


}
