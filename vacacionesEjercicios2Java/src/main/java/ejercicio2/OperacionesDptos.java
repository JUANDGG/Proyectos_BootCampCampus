
package ejercicio2;


public interface OperacionesDptos {
    Departamento buscarDpto(String nombreDpto);
    void agregarDepartamento(Departamento d);
    String listarGobernador (String nombreDepartamento);
    int calcularCenso(String nombreDepartamento);
    double calcularArea(String nombreDepartamento);
}
