{
1. Realice un programa que lea 7 valores enteros.
Genere una lista donde los elementos se inserten adelante.
Al finalizar implemente un módulo recursivo que imprima los valores de la lista.
}

program teoria2ej1;

type
    lista = ^nodo;
    nodo = record
         dato: integer;
         sig: lista;
         end;

procedure agregarAdelante (var l:lista; n:integer);
var
	nue: lista;
begin
	new (nue);
	nue^.dato:= n;
	nue^.sig := l;
	l:= nue;
end;

procedure imprimirRecursivo (l: lista);
begin
     if (l <> nil) then begin
        writeln (l^.dato);
        l:= l^.sig;
        imprimirRecursivo (l);
     end;
end;

var
   num: integer;
   l: lista;
   i: integer;

begin
     for i:= 1 to 4 do begin
         write ('Ingrese un numero: ');
         readln (num);
         agregarAdelante (l, num);
     end;
     writeln('');
     imprimirRecursivo (l);
     writeln('');
     writeln('******** FIN DEL PROGRAMA *********');
     readln;
end.
