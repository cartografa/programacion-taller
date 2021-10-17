package tema5;
/*
 */
public class Ej01C_Tema5 {
    
    public static void main(String [] args) { 
        Triangulo tri = new Triangulo(3, 3, 2, "azul", "rojo");
        Circulo cir = new Circulo(15, "azul", "gris");
        Cuadrado cua = new Cuadrado(5, "violeta", "morado");
        
        
        
        System.out.println("Área del triángulo: " + tri.calcularArea());
        System.out.println("Perímetro del triángulo: " + tri.calcularPerimetro());
        System.out.println(tri.toString());
        System.out.println("");
        System.out.println("Área del círculo: " + cir.calcularArea());
        System.out.println("Perímetro del círculo: " + cir.calcularPerimetro());
        System.out.println(cir.toString());
        System.out.println("");
        System.out.println("Área del cuadrado: " + cua.calcularArea());
        System.out.println("Perímetro del cuadrado: " + cua.calcularPerimetro());
        System.out.println(cua.toString());
        
    }   
}
