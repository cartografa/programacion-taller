package tema4;

/*
Definir una clase para representar flotas de micros. Una flota se caracteriza por
conocer a los micros que la componen (a lo sumo 15). Defina un constructor para crear
una flota vacía (sin micros).
Implemente métodos para:
i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
ii. agregar a la flota un micro recibido como parámetro.
iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y
retornar si la operación fue exitosa
iv. buscar en la flota un micro con patente igual a una recibida como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null).
v. buscar en la flota un micro con destino igual a uno recibido como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null). 
 */

public class FlotaDeMicros {
    private Micro[] flota;
    private int dimL;
    
    public FlotaDeMicros() {
        flota = new Micro[15];
        for (int i = 0; i < 15; i++) {
            flota[i] = null;
        }
        dimL = 0;
    }
    
    public boolean estaCompleta() {
        return (dimL == 15);
    }
    
    public void agregarMicro(Micro m) {
        if (!this.estaCompleta()) {
            this.flota[dimL] = m;
            this.dimL++;
        }
    }
    
    public String eliminarMicro(String patente) {
        boolean encontre = false;
        int aux = 0;
        while (aux < dimL && !encontre) {
            if (this.flota[aux].getPatente().equals(patente)) {
                encontre = true;
            } else {
                aux++;
            }
        }
        if (encontre == true) {
            for (int i = aux+1; i < dimL; i++) {
                this.flota[aux-1] = this.flota[aux];
            }
            dimL--;
            return "Operación exitosa";
        } else {
            return "El micro no se encontró en la flota";
        }    
    }
    
    public Micro buscarPorPatente(String patente) {
         boolean encontre = false;
         int aux = 0;
         while (aux < dimL && !encontre) {
            if (this.flota[aux].getPatente().equals(patente)) {
                encontre = true;
            } else {
                aux++;
            }
        }
        if (encontre) {
            return flota[aux];
        } else {
            return null;
        }
    }
    
    public Micro buscarPorDestino(String destino) {
         boolean encontre = false;
         int aux = 0;
         while (aux < dimL && !encontre) {
            if (this.flota[aux].getDestino().equals(destino)) {
                encontre = true;
            } else {
                aux++;
            }
        }
        if (encontre) {
            return flota[aux];
        } else {
            return null;
        }
    }
    
    
}
