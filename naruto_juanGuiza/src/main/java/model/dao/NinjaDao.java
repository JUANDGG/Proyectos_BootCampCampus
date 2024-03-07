package model.dao;

import model.Habilidad;
import model.Ninja;
import java.util.*;

public interface NinjaDao {

    List<Ninja> listarTodos() ;
    void crearNinja(Ninja ninja);
    void modificarNinja(int idNinja ,String nombreNinja);
    void eliminarNinja(int idNinja);

    boolean buscarNinja(int idNinja);



    void asignarHabilidad(Habilidad habilidad);
}
