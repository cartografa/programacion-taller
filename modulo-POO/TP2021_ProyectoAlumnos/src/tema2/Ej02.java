package tema2;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/*
Utilizando la clase Persona (ya implementada). Realice un programa que almacene en
un vector 15 personas. La información de cada persona debe leerse de teclado. Luego de
almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.
 */
public class Ej02 {
    public static void main (String [] args) {
        // creo vector de personas
        Persona [] vector = new Persona[15];
        
        // variables contadoras
        int mayor65 = 0;
        int menorDNI = 99999999;
        int indiceMenorDNI = -1;
        
        // leo datos
        for (int i = 0; i <= 14; i++) {
            System.out.print("Ingrese nombre de la persona: ");
            vector[i].setNombre(Lector.leerString());
            System.out.print("Ingrese DNI de la persona: ");
            vector[i].setDNI(Lector.leerInt());
            if (vector[i].getDNI() < menorDNI) {
                menorDNI = vector[i].getDNI();
                indiceMenorDNI = i;
            }
            System.out.print("Ingrese edad de la persona: ");
            vector[i].setEdad(Lector.leerInt());
            if (vector[i].getEdad() > 65) {
                mayor65++;
            } 
        }
        System.out.println("La cantidad de personas mayores de 65 años son " + mayor65);
        System.out.println(vector[indiceMenorDNI].toString());
    }
}
