{
Realizar un programa que lea números y que utilice un procedimiento recursivo que
escriba el equivalente en binario de un número decimal. El programa termina cuando el
usuario ingresa el número 0 (cero).
}


program ej7;

type
    lista = ^nodo;
    nodo = record
           dato: integer;
           sig: lista;
           end;

procedure agregarAdelante (var l: lista; n: integer);
var
   nue: lista;
begin
     new (nue);
     nue^.dato:= n;
     nue^.sig:= l;
     l:= nue;
end;

procedure conversionBin (num: integer; var res: lista);
begin
     if (num <> 0) then begin
        agregarAdelante (res, num mod 2);
        conversionBin (num div 2, res);
     end;
end;

procedure imprimirLista (l: lista);
begin
     while (l <> nil) do
     begin
           write (l^.dato);
           l:= l^.sig;
     end;
end;



var
  num: integer;
  resultado: lista;

begin
     write ('Ingrese numero decimal para convertir en binario: ');
     readln (num);
     resultado:= nil;
     conversionBin (num, resultado);
     write ('El resultado de la conversion es: ');
     imprimirLista (resultado);
     writeln ('');
     readln;
end.
