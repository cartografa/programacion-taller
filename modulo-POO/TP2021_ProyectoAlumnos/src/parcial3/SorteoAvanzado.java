package parcial3;
import PaqueteLectura.GeneradorAleatorio;

public class SorteoAvanzado extends Sorteo {
    public SorteoAvanzado(double premio) {
        super(premio);
    }
     
    public String sortearPremio() {
                System.out.println(this.getDimL());

        int nro1 = GeneradorAleatorio.generarInt(this.getDimL());
        int nro2 = GeneradorAleatorio.generarInt(this.getDimL());
        while (nro1 == nro2) {nro2 = GeneradorAleatorio.generarInt(this.getDimL());} //en caso de que se repita el numero
        return "Premio Neto: " + this.calcularNeto()/2 + ". Ganador(a) 1: " + this.getBono()[nro1].getNombre() + ", " + this.getBono()[nro1].getDni() + ". Ganador(a) 2: " + this.getBono()[nro2].getNombre() + ", " + this.getBono()[nro2].getDni();
    }
}
