/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author caros
 */
public class LibroImpreso extends Libro {
    private boolean tapaDura;
    
     public LibroImpreso(String t, double pBase, boolean tapaDura) {
        super(t, pBase);
        setTapaDura(tapaDura);
    }
    
    public LibroImpreso(String t, double pBase) {
        super(t, pBase);
    }

    public boolean isTapaDura() {
        return tapaDura;
    }

    public void setTapaDura(boolean tapaDura) {
        this.tapaDura = tapaDura;
    }
    
    public double obtenerPrecioFinal() {
        if (tapaDura) {
            return this.getPrecioBase() + 500;
        }
        return this.getPrecioBase();
    }
    
    public String toString() {
        return super.toString() + "Valor: " +  this.obtenerPrecioFinal();
    }
    
}
