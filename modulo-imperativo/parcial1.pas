{
1) Una obra social dispone de un árbol binario de búsqueda con la información
de sus afiliados. De cada afiliado se conoce: Número de afiliado, Nro de DNI,
Plan (1..5) y año de ingreso a la obra social.
El árbol se encuentra ordenado por número de afiliado. Se solicita:
Implementar un módulo que reciba el árbol de afiliados, Nro de DNI Num1, Nro de DNI
Num2 y un número de Plan, y retorne un vector ordenado por Nro de DNI del afiliado.
El vector debe contener el número de afiliado y DNI de aquellos afiliados cuyo
Nro de DNI se encuentra comprendido entre Num1 y Num2 (siendo Num1 menor que Num2)
y el Plan se corresponda con el recibido por parámetro.
Por norma de la obra social, cada Plan puede contar con a lo sumo 500 afiliados.
}

program parcial1;
const
     dimF = 500;
type
    planes: 1..5;
    afiliado = record
             nro: integer;
             dni: integer;
             plan: planes;
             ingreso: integer;
             end;

    arbol = ^nodo;
    nodo = record
         dato: afiliado;
         HI: arbol;
         HD: arbol;
         end;

    nueAfiliado: record
                 nro: integer;
                 dni: integer;
                 end;

    vector = array [1..dimF] of nueAfiliado;



{******************************************************}

procedure cargarArbol (var a: arbol);  {se dispone}
begin
end;

{******************************************************}

procedure agregar(var v: vector; dato: afiliado; dimL: integer);
var
   aux: nueAfiliado;
begin
     dimL:= dimL + 1;
     aux.nro:= dato.plan;
     aux.dni:= dato.dni;
     v[dimL]:= aux;
end;

procedure generarVector (afiliados: arbol; dniMin, dniMax: integer;
                         nro: planes; var v: vector; var dimL: integer);
var

begin
     if (a <> nil) then begin
		generarVector(a^.HI);
        if ((a^.dato.dni > dniMin) and (a^.dato.dni < dniMax) and (a^.dato.plan = nro) then
           agregar(v, a^.dato, dimL);
		generarVector(a^.HD);
	end;	
end;


{PROGRAMA PRINCIPAL}
var
   afiliados: arbol;
   dniMin: integer;
   dniMax: integer;
   nro: planes;
   dimL: integer;
   vectorAf: vector;

begin
     cargarArbol(afiliados); {se dispone}

     writeln('Ingrese limite inf: ');
     readln(dniMin);
     writeln('Ingrese limite sup: ');
     readln(dniMax);
     writeln('Ingrese un numero de plan: ');
     readln(nro);
     writeln('*******************************');

     dimL:= 0;
     generarVector(afiliados, dniMin, dniMax, nro, vectorAf, dimL);
     imprimirVector(vectorAf);
end.


