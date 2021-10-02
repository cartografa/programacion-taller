package tema3;

/*
3- A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).

 */
public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatos;
    
    /*------- CONSTRUCTORES --------*/
    public Entrenador(String nombre, double sueldoBasico, int campeonatos) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.campeonatos = campeonatos;
    }
    
    public Entrenador() {
        // contructor nulo
    }
    
    /* --------- SETTERS ---------*/
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setSueldoBasico(double sB) {
        this.sueldoBasico = sB;
    }
    
    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    /*---------- GETTERS ----------*/
    public String getNombre() {
        return this.nombre;
    }
    
    public double getSueldoBasico() {
        return this.sueldoBasico;
    }
    
    public int getCampeonatos() {
        return campeonatos;
    }
    
    /*------- OTROS METODOS -------*/
    public double calcularSueldoACobrar() {
        double aux;
        if (campeonatos >= 1 && campeonatos <= 4) {
            aux = this.getSueldoBasico() + this.getCampeonatos() * 5000;
        } else if (campeonatos >= 5 && campeonatos <= 10) {
            aux = this.getSueldoBasico() + this.getCampeonatos() * 30000;
        } else if (campeonatos > 10) {
            aux = this.getSueldoBasico() + this.getCampeonatos() * 30000;
        } else {
            aux = this.getSueldoBasico();
        }
        return aux;
    }  
}
