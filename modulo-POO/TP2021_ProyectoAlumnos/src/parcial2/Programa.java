package parcial2;

/*
Representar un concurso de baile. El concurso tiene a lo sumo N parejas.
Cada pareja tiene 2 participantes y un estilo de baile.
De los participantes se tiene DNI, nombre, edad.

a) Genere las clases necesarias. Provea constructores para iniciar: el concurso
con un máx de N parejas (inicialmente sin parejas cargadas); las parejas y los
participantes a partir de toda su información.

b) Implemente métodos en las clases adecuadas para permitir:
- Agregar una pareja al concurso. Asuma que hay lugar.
- Obtener la diferencia de edad de la pareja.
- Obtener la pareja con más diferencia de edad del concurso.

2. Realice un programa que instancie un concurso, cargue 2 parejas y a partir
del concurso muestre: los nombres de los participantes de la pareja con más
diferencia de edad.
 */
public class Programa {
    public static void main(String[] args) {
        Concurso nuevoConcurso = new Concurso(2);
        Pareja mayorDif;
        
        Participante p1 = new Participante(50, "Maria", 25);
        Participante p2 = new Participante(2, "Aldana", 29);
        Participante p3 = new Participante(4, "Pablo", 19);
        Participante p4 = new Participante(28, "Ludmila", 42);
        
        Pareja pareja1 = new Pareja(p1, p2, "Jazz");
        Pareja pareja2 = new Pareja(p3, p4, "Tango");
        
        nuevoConcurso.agregarPareja(pareja1);
        nuevoConcurso.agregarPareja(pareja2);
        
        System.out.println("Los nombres de la pareja con mayor dif de edad son:");
        mayorDif = nuevoConcurso.mayorDiferenciaDeEdad();
        System.out.println(mayorDif.getP1().getEdad());
        System.out.println(mayorDif.getP2().getEdad());
        
    }
}
