package tema3;
import PaqueteLectura.Lector;

/*
B- Realizar un programa principal que instancie un círculo, le cargue información leída
de teclado e informe en consola el perímetro y el área. 
 */

public class Ej04b_T3 {
    public static void main(String [] args) {
        Circulo c1 = new Circulo();
        
        System.out.println("Ingrese radio del círculo");
        c1.setRadio(Lector.leerDouble());
        System.out.println("Ingrese color de relleno");
        c1.setColorRelleno(Lector.leerString());
        System.out.println("Ingrese color de línea");
        c1.setColorLinea(Lector.leerString());
        
        System.out.println("Perimetro: " + c1.calcularPerimetro());
        System.out.println("Area: " + c1.calcularArea());
    }
}
