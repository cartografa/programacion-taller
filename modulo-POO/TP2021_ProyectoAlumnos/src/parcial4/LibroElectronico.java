/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

public class LibroElectronico extends Libro {
    private double tamanioMB;
    private String formato; 
    
    public LibroElectronico(String t, double pBase, double tamanioMB, String formato) {
        super(t, pBase);
        this.setTamanioMB(tamanioMB);
        this.setFormato(formato);
    }
    
    public LibroElectronico(String t, double pBase) {
        super(t, pBase);
    }

    public double getTamanioMB() {
        return tamanioMB;
    }

    public void setTamanioMB(double tamanioMB) {
        this.tamanioMB = tamanioMB;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }
    
    
    public double obtenerPrecioFinal() {
        return this.getPrecioBase() + (this.getTamanioMB() * 2.5);
    }
    
    public String toString() {
        return super.toString() + "Valor: " + this.obtenerPrecioFinal();
    }
    
}
