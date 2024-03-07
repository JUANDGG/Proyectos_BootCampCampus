/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.biblioteca;

import java.util.List;

/**
 *
 * @author user
 */
public interface OpBiblioteca {
    void aggRecurso(Recurso recurso);
    void prestarRecurso( int id) ;
    List<Recurso > buscarRecurso(String titulo) ;
    int buscarRecurso(int idRecurso) ;
}
