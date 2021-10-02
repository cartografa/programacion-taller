package tema4;

/*
Implemente la clase Autor, considerando que éstos
se caracterizan por nombre y biografía. El autor debe poder devolver/modificar el valor de
sus atributos. 
 */

public class Autor {
    private String nombre;
    private String biografia;
    
    /*----- SETTERS -----*/
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }
    
    /*----- GETTERS ------*/
    public String getNombre() {
        return this.nombre;
    }
    
    public String getBiografia() {
        return this.biografia;
    }
}
