package tema4;

/*
4-A- Definir una clase para representar micros. Un micro conoce su patente, destino, hora
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos
ocupados al momento. Lea detenidamente a) y b) y luego implemente.
a) Implemente un constructor que permita iniciar el micro con una patente, un destino y
una hora de salida (recibidas por parámetro) y sin pasajeros.
b) Implemente métodos para:
i. devolver/modificar patente, destino y hora de salida
ii. devolver la cantidad de asientos ocupados
iii. devolver si el micro está lleno
iv. validar un número de asiento recibido como parámetro (es decir, devolver si está
en rango o no)
v. devolver el estado de un nro. de asiento válido recibido como parámetro
vi. ocupar un nro. de asiento válido recibido como parámetro
vii. liberar un nro. de asiento válido recibido como parámetro
viii. devolver el nro. del primer asiento libre
 */

public class Micro {
    private String patente;
    private String destino;
    private int horaSalida;
    private boolean[] asientos = new boolean[20];
    private int cantidadOcupada;
    
    /*------- CONSTRUCTOR ---------*/
    public Micro(String patente, String destino, int horaSalida) {
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        this.cantidadOcupada = 0;
        for (int i = 0; i < 20; i++) {
            asientos[i] = false;
        }
    }
    
    /*-------- GETTERS ---------*/
    public String getPatente() {
        return this.patente;
    }
    
    public String getDestino() {
        return this.patente;
    }
    
    public int getHoraSalida() {
        return this.horaSalida;
    }
    
    public int getAsientosOcupados() {
        return this.cantidadOcupada;
    }
    
    /*-------- SETTERS ---------*/
    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    public void setDestino(String destino) {
        this.destino = destino;
    }
    
    public void setHoraSalida(int horaSalida) {
        this.horaSalida = horaSalida;
    }
    
    /*------ OTROS METODOS -------*/
    public boolean estaLleno() {
        return this.getAsientosOcupados() == 20;
    }
    
    public boolean validarAsiento(int asiento) {
        return (asiento >= 0 && asiento < 20);
    }
    
    public boolean estaLibre(int num) {
        if (this.validarAsiento(num)) {
            return !this.asientos[num];
        } else {
            return false;
        }
    }
    
    public void ocuparAsiento(int num) {
        if (this.validarAsiento(num)) {
            this.asientos[num] = true;
            this.cantidadOcupada++;
        }
    }
    
    public void liberarAsiento(int num) {
        if (this.validarAsiento(num)) {
            this.asientos[num] = false;
            this.cantidadOcupada--;
        }
    }
    
    public int primerAsientoLibre() {
            
        }
    }
    
}
