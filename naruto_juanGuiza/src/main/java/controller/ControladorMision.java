package controller;

import model.Mision;
import model.Ninja;
import model.dao.MisionDaoImpl;

import java.util.List;

public class ControladorMision {

    private MisionDaoImpl misionDaoImpl ;

    public ControladorMision() {
        this.misionDaoImpl = new MisionDaoImpl();
    }

    public void mostrarMisiones  () {
        List<Mision> listaMisiones =misionDaoImpl.listarTodos();
        for (Mision i : listaMisiones){
            System.out.println(i.toString());
        }
    }

    public void crearMision(String descripcion , String recompenza , String rango){
        Mision mision = new Mision(descripcion,recompenza,rango);
        misionDaoImpl.crearMision(mision);
    }

    public void modificarMision(int idMision , String nombreMision) {
        misionDaoImpl.modificarMision(idMision,nombreMision);
    }

    public void eliminarNinja(int idMision){
        misionDaoImpl.eliminarMision(idMision);
    }

}
