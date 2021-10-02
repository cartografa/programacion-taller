package tema4;
import PaqueteLectura.Lector;

/*
B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro.
del primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro. 
 */

public class Ej04b_T4 {
    public static void main(String [] args) {
        Micro micro1 = new Micro("ABC123", "Mar del Plata", 500);
        int asiento;
        System.out.print("Ingrese asiento a ocupar: ");
        asiento = Lector.leerInt();
        while (asiento != -1 && !micro1.estaLleno()) {
            if (micro1.estaLibre(asiento)) {
                micro1.ocuparAsiento(asiento);
                System.out.println("Éxito de la operación");
                System.out.println("");
            } else {
                System.out.println("El asiento ya está ocupado");
                System.out.println("El primer asiento libre es el " + micro1.primerAsientoLibre());
                System.out.println("");
            }
            System.out.print("Ingrese asiento a ocupar: ");
            asiento = Lector.leerInt();
            System.out.println("");
        }       
    }
}
