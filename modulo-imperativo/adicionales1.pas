{
1. Una aerol�nea dispone de un �rbol binario de b�squeda con la informaci�n de sus
empleados. De cada empleado se conoce: N�mero de legajo, Dni, Categor�a (1..20) y a�o de
ingreso a la empresa. El �rbol se encuentra ordenado por n�mero de legajo. Se solicita:
a. Implementar un m�dulo que reciba el �rbol de empleados, n�mero de legajo �A�,
n�mero de legajo �B� y un n�mero de categor�a, y retorne un vector ordenado por
n�mero de legajo. El vector debe contener el n�mero de legajo y Dni de aquellos
empleados cuyo n�mero de legajo se encuentra comprendido entre los n�meros de
legajo recibidos (�A� y �B�, siendo �A� menor que �B�) y la categor�a se corresponda con
la recibida por par�metro. Por norma de la empresa, cada categor�a puede contar con
a lo sumo 250 empleados.
b. Implementar un m�dulo recursivo que reciba la informaci�n generada en �b� y retorne
el promedio de los n�meros de Dni.
}



program adicionales1;

const
  maxCategoria = 250;

type
  rango = 1..20;
  empleado = record
           legajo: integer;
           DNI: integer;
           categoria: rango;
           anioIngreso: 1900...2021;
           end;

  arbol = ^nodo;
  nodo = record
       dato: empleado;
       HI: arbol;
       HD: arbol;
       end;

  empleadosAB = record
              legajo: integer;
              DNI: integer;
              end;

  vEmpleados = array [1..maxCategoria] of empleadosAB;


{******* PROCEDIMIENTOS Y FUNCIONES *******}

{�rbol ordenado por legajo ~~~~~ se dispone}

procedure retornarVector (a:arbol; inf, sup:integer; cat: rango; var v: vEmpleados; var dimL: integer);
begin
  if (a <> nil) then begin
     if (inf < a^.dato.legajo) then
        guardarRango(a^.hi, inf, sup, v, dimL); {llamo al proc. nuevamente con rama a la izquierda}
     if ((a^.dato.legajo > inf) and (a^.dato.legajo < sup)) then begin
       if (a^.dato.categoria = cat) and (dimL < maxCategoria) then begin
          dimL = dimL + 1;
          v[dimL+1].legajo = a^.dato.legajo;
          v[dimL+1].DNI = a^.dato.DNI;
       end
       guardarRango(a^.hi, inf, sup, v, dimL); {sigo con el prox. hijo}
     end;
     if (sup > a^.dato.legajo) then
       guardarRango(a^.hd, inf, sup, v, dimL);
  end;
end;


function calcularPromV (v: vEmpleados; i: integer; dimL: integer): real;
begin
     if (i <= dimL) then
        calcularPromV:= v[i].dni / dimL + calcularPromV(v, dimL, i + 1);
end;



