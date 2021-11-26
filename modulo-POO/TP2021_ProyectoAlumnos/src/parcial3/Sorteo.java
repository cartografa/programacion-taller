/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

/**
 *
 * @author caros
 */
public abstract class Sorteo {
    private double premio;
    private Persona[] bono;
    private int dimL;
    
    public Sorteo(double valor) {
        premio = valor;
        bono = new Persona[99];
        dimL = 0;
    }

    public double getPremio() {
        return premio;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dim) {
        dimL = dim;
    }

    public void setPremio(double valor) {
        premio = valor;
    }

    public Persona[] getBono() {
        return bono;
    }

    public void setBono(Persona[] bonos) {
        bono = bonos;
    }
    
    public int agregarParticipante(Persona unaPersona) {
        int nro = dimL;
        bono[dimL] = unaPersona;
        dimL++;
        return nro;
    }
    
    public Persona verificarBono(int nro) {
        return bono[nro];
    }
    
    public double calcularNeto() {
        return premio - premio*0.21;
    }
    
    public abstract String sortearPremio();
}
