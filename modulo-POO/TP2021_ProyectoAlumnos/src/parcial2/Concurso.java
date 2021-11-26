package parcial2;
/*

 */
public class Concurso {
    private Pareja[] parejas;
    private int dimL;
    
    public Concurso(int nro) {
        parejas = new Pareja[nro];
        setDimL(0);
    }

    public int getDimL() {
        return dimL;
    }

    public void agregarPareja(Pareja pareja) {
        this.parejas[getDimL()] = pareja; 
        setDimL(this.dimL++);
    }
    
    public Pareja mayorDiferenciaDeEdad() {
        int max = -1;
        Pareja mayor = null;
        for (int i = 0; i < dimL; i++) {
            if (this.parejas[i].diferenciaDeEdad() > max) {
                max = this.parejas[i].diferenciaDeEdad();
                mayor = this.parejas[i];
            }
        }
        return mayor;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    
    
}
