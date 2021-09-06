{
4. Escribir un programa que:
   a. Implemente un módulo que genere una lista a partir de la lectura de números
   enteros. La lectura finaliza con el número -1.
   b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
   c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
   d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
   se encuentra en la lista o falso en caso contrario.
}

program ej4;

type
    lista = ^nodo;
    nodo = record
           dato: integer;
           sig: lista;
           end;

{*******************************************}
{           (a) generar lista               }
{*******************************************}

procedure agregarAdelante (var l:lista; n:integer);
var
	nue: lista;
begin
	new (nue);
	nue^.dato:= dato;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista (var l: lista);
var
   n: integer;
begin
     write ('Ingrese un numero: ');
     readln (n);
     while (n <> -1) do begin
           agregarAdelante (l, n);
           write ('Ingrese un numero: ');
           readln (n);
     end;
end;

{*******************************************}
{    (b) recursión para buscar mínimo       }
{*******************************************}

function minimo (l: lista):integer;
var
   min: integer;
begin
     min:= 999999;
     if (l = nil) then
           minimo:= min;
     else
         if (l^.dato < min) then begin
            min:= l^.dato;
            minimo:= buscar (l^.sig)
         else
             minimo:= buscar (l^.sig);
end;



{*******************************************}
{    (c) recursión para buscar máximo       }
{*******************************************}

{*******************************************}
{         (d) búsqueda recursiva            }
{*******************************************}

function buscar (l:lista; x: integer):boolean;
begin
  if (l = nil) then
    buscar:= false
  else
    if (l^.dato = x) then
       buscar:= true
    else
      buscar:= buscar(l^.sig, x);
end;

{*******************************************}
{            PROGRAMA PRINCIPAL             }
{*******************************************}

var
   l: lista;

begin

end.
