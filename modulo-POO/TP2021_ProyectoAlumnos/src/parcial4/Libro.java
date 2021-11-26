/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

public abstract class Libro {
    private String titulo;
    private double precioBase;
    private Autor[] autores;
    private int dimL;
            
    public Libro(String t, double pBase) {
        autores = new Autor[8];
        titulo = t;
        precioBase = pBase;
        dimL = 0;
    }
    
    public Libro() {
      // constructor vacío  
    }
    
    /* GETTERS Y SETTERS */
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String unTitulo) {
        titulo = unTitulo;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double unPrecio) {
        precioBase = unPrecio;
    }

    public Autor[] getAutores() {
        return autores;
    }

    public void setAutores(Autor[] aut) {
        autores = aut;
    }
    
    /*OTROS METODOS*/
    public void agregarAutor(Autor unAutor) {
        autores[dimL] = unAutor;
        dimL++;
    }

    public String toString() {
        String aux = "";
        for (int i = 0; i < dimL; i++) {
            aux = aux + autores[i].getNombre() + ". ";
        }
        return "Libro: Titulo= " + titulo + "; Autores= " + aux;
    }
    
    public abstract double obtenerPrecioFinal();  
}
