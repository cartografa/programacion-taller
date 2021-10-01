package tema3;

/*
5-A- Modifique el ejercicio 2-A. Ahora la balanza debe poder generar un resumen de
compra más completo. Para eso agregue a la balanza la característica resumen (String).
Modifique los métodos:
▪ iniciarCompra para que además inicie el resumen en el String vacío.
▪ registrarProducto para que reciba un objeto Producto (que se caracteriza por peso en
kg y descripción) y su precio por kg. La operación debe realizar las actualizaciones en
monto /cantidad de ítems y adicionar al resumen (string) la descripción y el monto
pagado por este producto.
▪ devolverResumenDeCompra() para que retorne un String del siguiente estilo:
“Naranja 100 pesos – Banana 40 pesos – Lechuga 50 pesos – Total a pagar 190 pesos
por la compra de 3 productos” . La sección subrayada es el contenido de resumen.
Realice las modificaciones necesarias en el programa principal solicitado en 2-B para
corroborar el funcionamiento de la balanza.
NOTA: dispone en la carpeta tema 3 de la clase Producto ya implementada.
Para adicionar la información del producto recibido al resumen use concatenación de
Strings (operación +). 
 */

public class Balanza2 {
    private double monto;
    private int cantItems;
    private String resumen;
    
    public void iniciarCompra() {
        this.monto = 0;
        this.cantItems = 0;
        this.resumen = "";
    }
    
    public void RegistrarProducto(Producto prod, double precioPorKg) {
        this.monto = this.monto + prod.getPesoEnKg() * precioPorKg;
        this.cantItems++;
        this.resumen += prod.getDescripcion() + " " + this.monto + "pesos\n";
    }
    
    public double devolverMontoAPagar() {
        return this.monto;
    }
    
    public String devolverResumenDeCompra() {
        return this.resumen; 
    }
}
