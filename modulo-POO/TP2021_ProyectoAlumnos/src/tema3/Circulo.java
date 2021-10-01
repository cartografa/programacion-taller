package tema3;

/*
4-A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String). El círculo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    /* --------- SETTERS ---------*/
    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public void setColorRelleno(String cR) {
        this.colorRelleno = cR;
    }
    
    public void setColorLinea(String cL) {
        this.colorLinea = cL;
    }
    
    /*---------- GETTERS ----------*/
    public double getRadio() {
        return this.radio;
    }
    
    public String getColorRelleno() {
        return this.colorRelleno;
    }
    
    public String getcolorLinea() {
        return this.colorLinea;
    }
    
    /*----- Otros comportamientos -----*/
    public double calcularPerimetro() {
        return 2 * Math.PI * this.getRadio();
    }
    
    public double calcularArea() {
        return Math.PI * (this.getRadio() * this.getRadio());
    }
}
