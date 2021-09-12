{
Escribir un programa que:
a. Implemente un m�dulo que lea n�meros enteros y los almacene en un �rbol
binario de b�squeda. La lectura finaliza con el valor 0.
b. Una vez generado el �rbol, realice m�dulos independientes para:
i. Obtener el n�mero m�s grande.
ii. Obtener el n�mero m�s chico.
iii. Obtener la cantidad de elementos.
iv. Informar los n�meros en orden creciente.
v. Informar los n�meros pares en orden decreciente.
}


program ej8;

type
    arbol = ^nodo;
    nodo = record
         dato: integer;
         HI: arbol;
         HD: arbol;
         end;

{**************** CARGAR �RBOL *****************}

procedure crear (var a: arbol; num: integer);
begin
     if (a = nil) then begin
        new (a);
        a^.dato:= num;
        a^.HI:= nil;
        a^.HD:= nil;
     end
     else
         if (num < a^.dato) then
            crear (a^.HI, num)
         else
            crear (a^.HD, num);
end;


{************ b.i) NUMERO M�S GRANDE *************}

function maximo (a:arbol): arbol;
begin
	if (a = nil) then
		maximo:= nil
	else
		if (a^.HD = nil) then
			maximo:= a
		else
			maximo:= maximo (a^.HD);
end;


{************ b.ii) NUMERO M�S CHICO *************}

function minimo (a:arbol): arbol;
begin
	if (a = nil) then
		minimo:= nil
	else
		if (a^.HI = nil) then
			minimo:= a
		else
			minimo:= minimo (a^.HI);
end;

{********* b.iii) CANTIDAD DE ELEMENTOS **********}

function contarNodos (a:arbol): integer;
begin
  if (a=nil) then
    contarNodos:= 0
  else
    contarNodos:= 1 + contarNodos(a^.HI) + contarNodos(a^.HD);
end;

{************* b.iv) ORDEN CRECIENTE **************}

procedure enOrdenC (a: arbol);
begin
     if (a <> nil) then begin
        enOrdenC (a^.HI);
        writeln (a^.dato);
        enOrdenC (a^.HD);
     end;
end;

{**** b.v) NUMEROS PARES EN ORDEN DECRECIENTE ****}

procedure parEnOrdenD (a: arbol);
begin
     if (a <> nil) then begin
        parEnOrdenD (a^.HD);
        if (a^.dato mod 2 = 0) then writeln (a^.dato);
        parEnOrdenD (a^.HI);
     end;
end;

{************** PROGRAMA PRINCIPAL **************}

var
   a: arbol;
   x: integer;
   i: integer;

begin
     a:= nil;
     // carga random del arbol
     for i:= 1 to 30 do begin
         x:= random(50);
         crear (a, x);
     end;
     enOrdenC (a);
     writeln ('---------------------------');
     parEnOrdenD (a);
     writeln ('---------------------------');
     if (maximo(a) <> nil) then
        writeln ('El numero mas grande es ', maximo(a)^.dato);
     if (minimo(a) <> nil) then
        writeln ('El numero mas chico es ', minimo(a)^.dato);
     writeln ('---------------------------');
     writeln ('La cantidad de elementos del arbol es ', contarNodos(a));
     writeln ('----------FIN----------');
     readln;
end.
