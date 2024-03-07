package model;

public class Habilidad {
    private  int idNinja ;
    private  String nombre ;
    private  String descripcion ;


    public Habilidad(int idNinja, String nombre, String descripcion) {
        this.idNinja = idNinja;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    // getters
    public int getIdNinja() {
        return idNinja;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }


    // setters


    public void setIdNinja(int idNinja) {
        this.idNinja = idNinja;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
