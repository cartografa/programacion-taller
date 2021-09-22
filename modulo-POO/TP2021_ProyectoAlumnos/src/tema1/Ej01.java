package tema1;
import PaqueteLectura.Lector;

/*
Escriba un programa que imprima en consola el factorial de un número N
(ingresado por teclado, N > 0). Ejemplo: para N=5 debería imprimir 5! = 120
 */

public class Ej01 {
    public static void main (String[] args) {
        System.out.println("Ingrese un número para obtener su factorial:");
        int num = Lector.leerInt();
        while (num < 1) {
            System.out.println("El número debe ser un entero positivo.");
            System.out.println("Ingrese un número para obtener su factorial:");
            num = Lector.leerInt();
        } 
        int factorial = 1;
        int elegido = num;
        while (num != 0) {
            factorial = factorial * num;
            System.out.println(factorial);
            num--;
        }
        System.out.println("El factorial de " + elegido + " es " + factorial);
    }
}
