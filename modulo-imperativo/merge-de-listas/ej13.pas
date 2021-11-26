{
Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las
entradas vendidas. Se desea procesar la información de una semana.
Implementar un programa que:
a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1
a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0.
Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista
debe estar ordenada por código de obra de forma ascendente.
}


program ej13;
const
     dimF = 7;
type
    entrada = record
            dia: 1..7;
            cod: integer;
            asiento: integer;
            monto: real;
            end;

    lista = ^nodo;
    nodo = record
         dato: entrada;
         sig: lista;
         end;

    entradasPorObra = record
                    cod: integer;
                    cant: integer;
                    end;

    listaMerge = ^nodo;
    nodoMerge = record
              dato: entradasPorObra;
              sig: listaMerge;
              end;

    vector = array [1..dimF] of lista;


//------------------------------PUNTO A------------------------------//

{CARGAR DATOS}
procedure inicializarListas (var v: vector);
var
   i: integer;
begin
     for i:= 1 to dimF do v[i]:= nil;
end;

{Random para hacer test}
procedure leerEntrada (var e: entrada);
begin
     with e do begin
          cod:= random(4);
          writeln('Codigo de obra: ', cod);

          if (cod <> 0) then begin
             dia:= random(7)+1;
             writeln('Dia de la obra: ', dia);
             asiento:= random(60);
             writeln('Asiento: ', asiento);
             monto:= random(400);
             writeln('Asiento: ', monto:2:2);

             writeln('******************');
          end;
     end;
end;


{insertar en orden ascendente}
procedure insertarOrdenado (var l: lista; e: entrada);
var
	nue, ant, act: lista;
begin
	new (nue);
    nue^.dato:= e;
	act:= l;
	ant:= l;  {ubico los dos al principio de la lista}

	while (act <> nil) and (act^.dato.cod < e.cod) do begin
		ant:= act;
		act:= act^.sig;
	end;

	if (ant = act) then l:= nue {dato al principio / o lista vacía}
	               else ant^.sig:= nue; {dato va entre otros dos o al final}
    nue^.sig:= act;
end;

// Cargo vector de listas
procedure cargarVector (var v: vector);
var
   e: entrada;
begin
     leerEntrada(e);
     while (e.cod <> 0) do begin
           insertarOrdenado (v[e.dia], e);
           leerEntrada(e);
     end;
end;

{******************************************************************}

{AGREGAR ATRAS}
procedure agregarAtras (var l, ult: listaMerge; act: entradasPorObra);
var
   nue: listaMerge;
begin
    new(nue);
    nue^.dato:= act;
    nue^.sig:= nil;
    if (l = nil) then l:= nue
                 else ult^.sig:= nue;
    ult:= nue;
end;
    
{MINIMO}
procedure minimo (var v: vector; var min: entrada);
var
     i, posMin: integer;
begin
    min.cod:= 999999;
    for i:= 1 to dimF do begin
      if (v[i] <> nil) then
         if (v[i]^.dato.cod < min.cod) then begin
            min:= v[i]^.dato;
            posMin:= i; {guardo la posicion de donde saqué el mínimo}
         end;
    end;
    if (min.cod <> 999999) then v[posMin]:= v[posMin]^.sig {avanzo el puntero}
end;


{MERGE ACUMULADOR}
procedure mergeAcumulador (var l: listaMerge; v: vector);
var
   min: entrada;
   act: entradasPorObra;
   ult: listaMerge;
begin
  l:= nil;
  minimo (v, min);
  while (min.cod <> 999999) do begin
        act.cod:= min.cod;          {guardo el actual cod actual}
        act.cant:= 0;               {contador de entradas en 0}
        while ((min.cod <> 999999) and (min.cod = act.cod)) do begin {mientras sean el mismo prod}
              act.cant:= act.cant + 1; {sumo cant}
              minimo(v, min);
        end;
        agregarAtras(l, ult, act);
  end;
end;


{******************************************************************}


procedure imprimirMerge(l: listaMerge);
begin
	if (l <> nil) then begin
		writeln('Lista nueva del merge:');
		writeln('');
		while (l <> nil) do begin
			writeln('De la obra ', l^.dato.cod, ' se vendieron ', l^.dato.cant, ' entradas.');
			l:= l^.sig;
		end;
	end
	else
		writeln('NO SE VENDIERON ENTRADAS');
end;

{PROGRAMA PRINCIPAL}
var
   semana: vector;
   totalEntradas: listaMerge;

begin
     randomize;
     inicializarListas(semana);
     cargarVector(semana);
     writeln('');
     mergeAcumulador(totalEntradas, semana);
     imprimirMerge(totalEntradas);
     writeln('');
     write('PRESIONE CUALQUIER TECLA PARA CERRAR EL PROGRAMA');
	 readln();
end.
