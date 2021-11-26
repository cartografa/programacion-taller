package parcial1;

/*
Un psicólogo necesita un sistema para organizar su agenda semanal. 
El sistema mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) 
del día, la información del paciente que tomó el turno. De los pacientes guarda: 
nombre, si tiene obra social y costo a abonar por la sesión.
a) Genere las clases necesarias. Implemente constructores para iniciar: el sistema 
sin pacientes; los pacientes a partir de toda su información.
b) Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un turno ese día. Asuma
que D es válido.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema. 
Libere turnos agendados. Para finalizar, imprima el resultado del inciso b.iii.
 */

public class Programa {
    public static void main(String[] args) {
        Sistema nuevoSistema = new Sistema();
        Paciente paciente1 = new Paciente("Carlos", true, 400);
        Paciente paciente2 = new Paciente("Margarita", false, 800);
        Paciente paciente3 = new Paciente("Gerardo", true, 400);
        
        nuevoSistema.agendarPaciente(4, 5, paciente3);
        nuevoSistema.agendarPaciente(3, 4, paciente2);
        nuevoSistema.agendarPaciente(4, 3, paciente1);
        
        nuevoSistema.liberarTurnos("Margarita");
        
        System.out.println(nuevoSistema.verificarTurno(4, "Carlos"));
        
        
    }
}
