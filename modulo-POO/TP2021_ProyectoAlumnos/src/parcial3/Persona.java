package parcial3;


public class Persona {
    private String nombre;
    private int dni;
    private double colaboracion;

    public Persona(String nombre, int dni, double colaboracion) {
        setNombre(nombre);
        setDni(dni);
        setColaboracion(colaboracion);
    }
        
    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public double getColaboracion() {
        return colaboracion;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setColaboracion(double colaboracion) {
        this.colaboracion = colaboracion;
    }
    
    
}
