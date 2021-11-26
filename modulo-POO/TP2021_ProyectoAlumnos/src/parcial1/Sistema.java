package parcial1;

/*
El sistema mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) 
del día, la información del paciente que tomó el turno.
METODOS:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un turno ese día. Asuma
que D es válido.
 */
public class Sistema {
    private Paciente[][] turnos;
    
    public Sistema() {
        turnos = new Paciente[5][6];
    }
    
    public void agendarPaciente(int dia, int horario, Paciente unPaciente) {
        turnos[dia][horario] = unPaciente;
    }
    
    public void liberarTurnos(String nombre) {
        for (int a = 0; a < 5; a++) {
            for (int b = 0; b < 6; b++) {
                if (turnos[a][b] != null && turnos[a][b].getNombre().equals(nombre)) {
                        turnos[a][b] = null;  
                }
            }
        }
    }
    
    public boolean verificarTurno(int dia, String nombre) {
        for (int i = 0; i < 6; i++) {
            if (turnos[dia][i] != null && turnos[dia][i].getNombre().equals(nombre)) {
                return true;
            }
        }
        return false;
    }
}
