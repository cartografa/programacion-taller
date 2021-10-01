package tema3;
import PaqueteLectura.Lector;

/*
B - Genere un programa principal que cree una balanza e inicie una compra. Lea
información desde teclado correspondiente a los ítems comprados (peso en kg y precio
por kg) hasta que se ingresa uno con peso 0. Registre cada producto en la balanza. Al
finalizar, informe el resumen de la compra.
 */

public class Ej02b_T3 {
    public static void main(String [] args) {
        Balanza bal = new Balanza();
        
        bal.iniciarCompra();
        
        System.out.print("Ingrese el peso en KG: ");
        double pesoEnKg = Lector.leerDouble();
        
        System.out.print("Ingrese el precio por KG: ");
        double precioPorKG = Lector.leerDouble();
        
        
        while (pesoEnKg != 0) {
            bal.RegistrarProducto(pesoEnKg, precioPorKG); 
            
            System.out.print("Ingrese el peso en KG: ");
            pesoEnKg = Lector.leerDouble();
            System.out.print("Ingrese el precio por KG: ");
            precioPorKG = Lector.leerDouble();
            
            System.out.println(bal.devolverMontoAPagar());
        }
        
        System.out.println(bal.devolverResumenDeCompra());
    }
}
