package controller;

import model.Ninja;
import model.dao.NinjaDaoImpl;

import java.util.List;

public class ControladorNinja {

    private NinjaDaoImpl ninjaDaoImpl;


    public ControladorNinja() {
        this.ninjaDaoImpl = new NinjaDaoImpl();
    }



    public void mostrarNinjas  () {
        List<Ninja> listaNinjas =ninjaDaoImpl.listarTodos();
        for (Ninja i : listaNinjas){
            System.out.println(i.toString());
        }
    }


    public void crearNinja(String nombre , String rango , String aldea){
        Ninja ninja = new Ninja(nombre,rango,aldea);
        ninjaDaoImpl.crearNinja(ninja);
    }

    public void modificarNinja(int idNinja , String nombreNinja) {
        ninjaDaoImpl.modificarNinja(idNinja,nombreNinja);

    }

    public void eliminarNinja(int idNinja){
        ninjaDaoImpl.eliminarNinja(idNinja);
    }

}
