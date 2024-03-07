package model;

public class Mision {
    private int id ;
    private String descripcion ;
    private  String recompensa ;
    private String rango ;
    private boolean estadoMision ;

    public Mision(String descripcion, String recompensa, String rango) {
        this.descripcion = descripcion;
        this.recompensa = recompensa;
        this.rango = rango;
    }

    // getters
    public int getId() {
        return id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getRecompensa() {
        return recompensa;
    }

    public String getRango() {
        return rango;
    }

    public boolean isEstadoMision() {
        return estadoMision;
    }

    // setters

    public void setId(int id) {
        this.id = id;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setRecompensa(String recompensa) {
        this.recompensa = recompensa;
    }

    public void setRango(String rango) {
        this.rango = rango;
    }

    public void setEstadoMision(boolean estadoMision) {
        this.estadoMision = estadoMision;
    }

    @Override
    public String toString() {
        return "Mision{" +
                "descripcion='" + descripcion + '\'' +
                ", recompensa='" + recompensa + '\'' +
                ", rango='" + rango + '\'' +
                '}';
    }
}
