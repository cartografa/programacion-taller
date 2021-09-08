{
4. Escribir un programa que:
   a. Implemente un m�dulo que genere una lista a partir de la lectura de n�meros
   enteros. La lectura finaliza con el n�mero -1.
   b. Implemente un m�dulo recursivo que devuelva el m�nimo valor de la lista.
   c. Implemente un m�dulo recursivo que devuelva el m�ximo valor de la lista.
   d. Implemente un m�dulo recursivo que devuelva verdadero si un valor determinado
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
	nue^.dato:= n;
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
{    (b) recursi�n para buscar m�nimo       }
{*******************************************}

function minimo (l: lista; min: integer): integer;
begin
     if (l = nil) then
         minimo:= min
     else if (l^.dato < min) then
          minimo:= l^.dato
          else
              minimo:= minimo(l^.sig, min);
end;



{*******************************************}
{    (c) recursi�n para buscar m�ximo       }
{*******************************************}

function maximo (l: lista; max: integer): integer;
begin
     if (l = nil) then
        maximo:= max
     else if (l^.dato > max) then
        maximo:= l^.dato
     else
        maximo:= maximo(l^.sig, max);
end;


{*******************************************}
{         (d) b�squeda recursiva            }
{*******************************************}

function buscar (l:lista; x: integer):boolean;
begin
     if (l = nil) then
        buscar:= false
     else if (l^.dato = x) then
        buscar:= true
     else
        buscar:= buscar(l^.sig, x);
end;

{*******************************************}
{            PROGRAMA PRINCIPAL             }
{*******************************************}

var
   l: lista;
   x, min, max: integer;

begin
   min:= 99999;
   max:= -99999;
   cargarLista (l);
   writeln('El elemento minimo de la lista es ', minimo(l, min));
   writeln('El elemento maximo de la lista es ', maximo(l, max));
   writeln('');
   write('Ingrese un numero a buscar: ');
   read(x);
   writeln('El resultado de la busqueda es ', buscar(l, x));
   writeln('');
   readln;
end.
