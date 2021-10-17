package tema5;

/*
Agregar la clase Triángulo a la jerarquía de figuras vista en clase 
(paquete tema5 del proyecto). Triángulo debe heredar de Figura todo 
lo que es común y definir su constructor y sus atributos y métodos propios. 
Además debe redefinir el método toString.
 */
public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo(double lado1, 
                     double lado2, 
                     double lado3, 
                     String unColorR, 
                     String unColorL) {
        super(unColorR, unColorL); //debe ir como primera linea la invocación super
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }
    
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public double getLado1() {
        return lado1;
    }
    
    public double getLado2() {
        return lado2;
    }
    
    public double getLado3() {
        return lado3;
    }
    
    public double calcularPerimetro() {
        return (this.getLado1())+(this.getLado2())+(this.getLado3());
    }
    
    public double calcularArea() {
        double s = calcularPerimetro()/2;
        return (Math.sqrt(s*(s-this.getLado1()))*(s*(s-this.getLado2()))*(s*(s-this.getLado3())));
    }

    public String toString() {
        String aux = super.toString() +
                      " Perímetro: " + calcularPerimetro() + 
                      " Lado1: " + getLado1() + 
                      " Lado2: " + getLado2() + 
                      " Lado3: " + getLado3();
        return aux;            
    }
}
    
