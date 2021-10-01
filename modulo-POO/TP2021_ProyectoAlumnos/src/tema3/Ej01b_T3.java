package tema3;
import PaqueteLectura.Lector;

/*
B- Realizar un programa principal que instancie un triángulo, le cargue información leída
desde teclado e informe en consola el perímetro y el área. 
 */
public class Ej01b_T3 {
    public static void main(String [] args) {
        Triangulo triangulo1 = new Triangulo();
        
        System.out.println("Ingrese lados del triángulo");
        System.out.print("Lado 1: ");
        triangulo1.setLado1(Lector.leerDouble());

        System.out.print("Lado 2: ");
        triangulo1.setLado2(Lector.leerDouble());

        System.out.print("Lado 3: ");
        triangulo1.setLado3(Lector.leerDouble());

        System.out.print("Ingrese color de relleno: ");
        triangulo1.setColorRelleno(Lector.leerString());
        
        System.out.print("Ingrese color de línea: ");
        triangulo1.setColorLinea(Lector.leerString());
        
        System.out.println("El perímetro del triángulo es " + triangulo1.calcularPerimetro());
        System.out.println("El área del triángulo es " + triangulo1.calcularArea());
    }
}
