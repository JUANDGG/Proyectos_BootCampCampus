package model;

public class Ninja {
    private int id;
    private String nombre;
    private String rango;
    private String aldea;
    private boolean estadoNinja;

    public Ninja(String nombre, String rango, String aldea) {
        this.nombre = nombre;
        this.rango = rango;
        this.aldea = aldea;
    }

    // getters
    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getRango() {
        return rango;
    }

    public String getAldea() {
        return aldea;
    }

    public boolean isEstadoNinja() {
        return estadoNinja;
    }

    // setters

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setRango(String rango) {
        this.rango = rango;
    }

    public void setAldea(String aldea) {
        this.aldea = aldea;
    }

    public void setEstadoNinja(boolean estadoNinja) {
        this.estadoNinja = estadoNinja;
    }


    @Override
    public String toString() {
        return "Ninja{" +
                "nombre='" + nombre + '\'' +
                ", rango='" + rango + '\'' +
                ", aldea='" + aldea + '\'' +
                '}';
    }
}
