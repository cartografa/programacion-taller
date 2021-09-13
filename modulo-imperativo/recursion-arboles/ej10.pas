{
Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene
en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
ingreso.
b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea inferior a 15853.
c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.

}

program ej10;

type
    cadena20 = string[20];

    alumno = record
           apellido: cadena20;
           nombre: cadena20;
           DNI: integer;
           legajo: integer;
           ingreso: integer;
           end;

    arbol = ^nodo;
    nodo = record
         dato: alumno;
         HI: arbol;
         HD: arbol;
         end;

{**************** CARGAR ÁRBOL *****************}

// leo un alumno
procedure leerAlumno (var a: alumno);
begin
     write ('Ingrese DNI: ');
     readln (a.DNI);
     if (a.DNI <> -1) then begin
        write ('Ingrese año de ingreso: ');
        readln (a.ingreso);
        if (a.ingreso > 2010) then begin
           write ('Ingrese apellido: ');
           readln (a.apellido);
           write ('Ingrese nombre: ');
           readln (a.nombre);
           write ('Ingrese legajo: ');
           readln (a.legajo);
        end;
     end;
end;

// cargo el arbol
procedure crear (var a: arbol; alu: alumno);
begin
     if (a = nil) then begin
        new (a);
        a^.dato:= alu;
        a^.HI:= nil;
        a^.HD:= nil;
     end
     else
         if (alu.legajo < a^.dato.legajo) then
            crear (a^.HI, alu)
         else
            crear (a^.HD, alu);
end;

// leo y cargo mientras cumpla las condiciones
procedure cargarABB (var a: arbol);
var
   alu: alumno;
begin
     leerAlumno (alu);
     while (alu.DNI <> -1) do begin
           if (alu.ingreso > 2010) then
              crear (a, alu);
           leerAlumno (alu);
     end;
end;

{********** b. LEGAJOS MENORES A 15853 **********}

procedure menores (a: arbol);
begin
     if (a <> nil) then begin
        if (a^.dato.legajo < 15853) then begin
           writeln (a^.dato.apellido, ', ', a^.dato.nombre);
           menores (a^.HI);
           menores (a^.HD);
        end
        else
            menores (a^.HI);
     end;
end;

{********** c. LEGAJOS ENTRE 1258 Y 7692 **********}

procedure entre (a: arbol);
begin
     if (a <> nil) then begin
        if (a^.dato.legajo > 1258) then begin
           if (a^.dato.legajo < 7692) then begin
              writeln (a^.dato.apellido, ', ', a^.dato.nombre);
              entre (a^.HI);
              entre (a^.HD);
           end
           else
              entre (a^.HI);
        end
        else
            entre (a^.HD);
     end;
end;

{************** PROGRAMA PRINCIPAL **************}

var
   a: arbol;

begin
     a:= nil;
     cargarABB (a);
     menores (a);
     writeln('**************************');
     entre (a);
     writeln ('*************************');
     readln;
end.
