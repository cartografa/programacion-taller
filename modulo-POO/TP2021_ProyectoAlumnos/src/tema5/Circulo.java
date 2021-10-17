package tema5;

/*
 */
public class Circulo extends Figura {
    private double radio;
    
    /*------ CONSTRUCTORES ------*/
    public Circulo(double radio, String unColorR, String unColorL) {
        super(unColorR, unColorL);
        setRadio(radio);
    }
     
    
    /* --------- SETTERS ---------*/
    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    /*---------- GETTERS ----------*/
    public double getRadio() {
        return this.radio;
    }
    
    /*----- Otros comportamientos -----*/
    public double calcularPerimetro() {
        return 2 * Math.PI * this.getRadio();
    }
    
    public double calcularArea() {
        return Math.PI * (this.getRadio() * this.getRadio());
    }
    
     public String toString() {
        String aux = super.toString() + 
                      "Perímetro: " + calcularPerimetro() + 
                      "Radio: " + getRadio();
        return aux;            
    }
}
