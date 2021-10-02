package tema3;

/*
1- A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)
 */

public class Triangulo {
    /* ---- Variables de instancia -----*/
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    
    /* ----------- Constructores -----------*/    
    public Triangulo (double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    public Triangulo() {
        // Constructor vacío
    }
    
    /* ----------- Getters --------------*/
    public double getLado1() {
        return lado1;
    }
    
    public double getLado2() {
        return lado2;
    }
     
    public double getLado3() {
        return lado3;
    }
     
    public String getColorRelleno() {
        return colorRelleno;
    }
     
    public String getColorLinea() {
        return colorLinea;
    }
    
    /* ----------- Setters --------------*/
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    /*----- Otros comportamientos -----*/
    public double calcularPerimetro() {
        return (this.getLado1())+(this.getLado2())+(this.getLado3());
    }
    
    public double calcularArea() {
        double s = calcularPerimetro()/2;
        return (Math.sqrt(s*(s-this.getLado1()))*(s*(s-this.getLado2()))*(s*(s-this.getLado3())));
    }
}