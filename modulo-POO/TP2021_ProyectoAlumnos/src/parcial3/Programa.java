package parcial3;

/*
Representar dos tipos de sorteos solidarios: común y avanzado. Ambos sorteos
mantienen el valor en pesos del premio y guardan para cada bono (0..99) la 
información de la persona a la que fue asignado (nombre, dni y colaboración en 
pesos). Sin embargo, difieren en cierta funcionalidad (detallada más adelante):

1- Genere las clases necesarias. Provea constructores para iniciar los sorteos 
a partir del premio en pesos (los bonos inicialmente no están asignados a nadie).

2- Implemente los métodos necesarios, en las clases que corresponda, para:

    a. Agregar una persona al sorteo, devolviendo el nro. de bono que le tocó. 
    Los nros. de bono se reparten en forma consecutiva comenzando de 0. 
    Asuma que hay un nro. de bono disponible.

    b. Obtener la persona que compró el nro. de bono B. Asuma que B es un nro. de 
    bono válido.

    c. Ejecutar el sorteo, devolviendo un String como se indica a continuación:
    Para los sorteos comunes: se elige el nro. de bono ganador aleatoriamente entre 
    los nros. repartidos, debiendo retornar “Premio Neto: ... Ganador: nombre - dni”.
    Para los sorteos avanzados: se eligen dos nros. de bono aleatoriamente entre 
    los nros. repartidos (quienes se dividirán el premio), debiendo retornar 
    “Premio Neto: … Ganador 1: nombre - dni Ganador 2: nombre - dni”.
    ** El Premio Neto se calcula descontando al premio en pesos el 21% de IVA.

3- Realice un programa que instancie un sorteo común y un sorteo avanzado con premio 
50.000$. Agregue personas a cada sorteo. Ejecute ambos sorteos e imprima la 
información obtenida de la ejecución.
 */
public class Programa {
    public static void main(String[] args) {
        Persona p1 = new Persona("A", 1, 100);
        Persona p2 = new Persona("B", 2, 100);
        Persona p3 = new Persona("C", 3, 100);
        Persona p4 = new Persona("D", 4, 100);
        Persona p5 = new Persona("E", 5, 100);
        Persona p6 = new Persona("F", 6, 100);
        
        SorteoComun sComun = new SorteoComun(50000);
        SorteoAvanzado sAvanzado = new SorteoAvanzado(50000);
        
        sComun.agregarParticipante(p1);
        sComun.agregarParticipante(p2);
        sComun.agregarParticipante(p3);
        
        sAvanzado.agregarParticipante(p4);
        sAvanzado.agregarParticipante(p5);
        sAvanzado.agregarParticipante(p6);
        
        
        System.out.println(sComun.sortearPremio());
        System.out.println("");
        System.out.println(sAvanzado.sortearPremio());


    }
}
