{
1. Realizar un programa que lea valores enteros y
genere un ABB hasta leer el valor 58.

2. Realice un módulo que imprima el árbol generado en 1.

3. Realice un módulo que reciba el árbol generado en 1 y
multiplique por 2 cada elemento

4. Realice un módulo que devuelva el elemento máximo del
árbol.
}

program teoriaArboles;

type
    arbol = ^nodo;
    nodo = record
           dato: integer;
           HI: arbol;
           HD: arbol;
           end;

{*******************************************}
{             (1) Cargar ABB                }
{*******************************************}

procedure crear (var a: arbol; n: integer);
begin
     if (a = nil) then begin
        new (a);
        a^.dato:= n;
        a^.HI:= nil;
        a^.HD:= nil;
     end
     else
         if (n < a^.dato) then
            crear (a^.HI, n)
         else
            crear (a^.HD, n);
end;

{*******************************************}
{            (2) Imprimir ABB               }
{*******************************************}

procedure imprimirEnOrden (a: arbol);
begin
     if (a <> nil) then begin
        imprimirEnOrden (a^.HI);
        writeln(a^.dato);
        imprimirEnOrden(a^.HD);
     end;
end;

{*******************************************}
{     (3) Multiplicar por 2 cada elemento   }
{*******************************************}

// procedure multiplicar (a: arbol);


{*******************************************}
{      (4) Elemento máximo del AB           }
{*******************************************}

function maximoElemento (a: arbol): arbol;
begin
	if (a = nil) then
		  maximoElemento:= nil
	else
		if (a^.HD = nil) then
			maximoElemento:= a
		else
			maximoElemento:= maximoElemento(a^.HD);
end;

{*******************************************}
{            PROGRAMA PRINCIPAL             }
{*******************************************}

var
   n: integer;
   abb: arbol;
   max: integer;

begin
     abb:= nil;
     write ('Ingrese un numero: ');
     readln (n);
     while (n <> 58) do begin
           crear (abb, n);
           write ('Ingrese un numero: ');
           readln (n);
     end;
     writeln ('');
     imprimirEnOrden (abb);
     writeln ('');
     // multiplicar (abb);
     // writeln ('');
     max:= (maximoElemento(abb))^.dato;
     writeln ('El elemento maximo del arbol es: ', max);
     readln;
end.
