package tema3;
import PaqueteLectura.Lector;

/*
B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos
desde teclado. Pruebe el correcto funcionamiento de cada método implementado
 */
public class Ej03b_T3 {
    public static void main(String [] args) {
        Entrenador e1 = new Entrenador();
        
        System.out.println("Ingrese nombre del entrenador");
        e1.setNombre(Lector.leerString());
        System.out.println("Ingrese su sueldo básico");
        e1.setSueldoBasico(Lector.leerDouble());
        System.out.println("Ingrese la cantidad de campeonatos ganados");
        e1.setCampeonatos(Lector.leerInt());
        
        System.out.println("Sueldo a cobrar: " + e1.calcularSueldoACobrar());
    }
}
