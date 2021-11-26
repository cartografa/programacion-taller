package parcial1;

/*
De los pacientes guarda: 
nombre, si tiene obra social y costo a abonar por la sesión.
 */
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costo;
    
    public Paciente(String nombre, boolean obraSocial, double costo) {
        setNombre(nombre);
        setObraSocial(obraSocial);
        setCosto(costo);
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }
    
    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public String getNombre() {
        return this.nombre;
    }
    
    public boolean getObraSocial() {
        return this.obraSocial;
    }
    
    public double getCosto() {
        return this.costo;
    }
}
