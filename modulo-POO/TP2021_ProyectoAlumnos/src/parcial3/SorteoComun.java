package parcial3;
import PaqueteLectura.GeneradorAleatorio;

public class SorteoComun extends Sorteo {
    public SorteoComun(double premio) {
        super(premio);
    }
    
    public String sortearPremio() {
        System.out.println(this.getDimL());
        int nro = GeneradorAleatorio.generarInt(this.getDimL());
        Persona ganadora = this.getBono()[nro];
        return "Premio Neto: " + this.calcularNeto() + ". Ganador: " + ganadora.getNombre() + ", " + ganadora.getDni();
    }
}
