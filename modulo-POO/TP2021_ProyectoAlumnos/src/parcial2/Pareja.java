package parcial2;
import java.lang.Math;

public class Pareja {
    private Participante p1;
    private Participante p2;
    private String estilo;
    
    /* CONSTRUCTOR */
    public Pareja(Participante p1, Participante p2, String estilo) {
       setP1(p1);
       setP2(p2);
       setEstilo(estilo);
    }
    
    /* GETTERS */
    public Participante getP1() {
        return p1;
    }

    public Participante getP2() {
        return p2;
    }
    
    public String getEstilo() {
        return estilo;
    }

    /* SETTERS */
    public void setP1(Participante p1) {
        this.p1 = p1;
    }

    public void setP2(Participante p2) {
        this.p2 = p2;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
    
    /* OTROS METODOS */
    public int diferenciaDeEdad() {
      int dif = getP1().getEdad() - getP2().getEdad();
      return Math.abs(dif);
    }
}
