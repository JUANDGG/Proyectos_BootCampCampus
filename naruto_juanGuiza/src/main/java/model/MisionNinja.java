package model;

public class MisionNinja {
    private int idNinja;
    private int idMision ;
    private  String fechaIncio ;
    private  String fechaFin ;


    public MisionNinja(int idNinja, int idMision, String fechaIncio, String fechaFin) {
        this.idNinja = idNinja;
        this.idMision = idMision;
        this.fechaIncio = fechaIncio;
        this.fechaFin = fechaFin;
    }

    // getters

    public int getIdNinja() {
        return idNinja;
    }

    public int getIdMision() {
        return idMision;
    }

    public String getFechaIncio() {
        return fechaIncio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    // setters


    public void setIdNinja(int idNinja) {
        this.idNinja = idNinja;
    }

    public void setIdMision(int idMision) {
        this.idMision = idMision;
    }

    public void setFechaIncio(String fechaIncio) {
        this.fechaIncio = fechaIncio;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }
}
