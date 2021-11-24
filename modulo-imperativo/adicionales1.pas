{
1. Una aerolínea dispone de un árbol binario de búsqueda con la información de sus
empleados. De cada empleado se conoce: Número de legajo, Dni, Categoría (1..20) y año de
ingreso a la empresa. El árbol se encuentra ordenado por número de legajo. Se solicita:
a. Implementar un módulo que reciba el árbol de empleados, número de legajo “A”,
número de legajo “B” y un número de categoría, y retorne un vector ordenado por
número de legajo. El vector debe contener el número de legajo y Dni de aquellos
empleados cuyo número de legajo se encuentra comprendido entre los números de
legajo recibidos (“A” y “B”, siendo “A” menor que “B”) y la categoría se corresponda con
la recibida por parámetro. Por norma de la empresa, cada categoría puede contar con
a lo sumo 250 empleados.
b. Implementar un módulo recursivo que reciba la información generada en “b” y retorne
el promedio de los números de Dni.
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

{árbol ordenado por legajo ~~~~~ se dispone}

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



