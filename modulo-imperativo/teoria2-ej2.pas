{
2. Realice un programa que lea números hasta leer el valor 0 e imprima sus dígitos
en el orden en que aparecen en el número. Ejemplo si se lee el valor 256,
se debe imprimir 2  5  6.
}

program teoria2ej2;

procedure imprimirDigitos (num: integer);
var
   dig: integer;
begin
     if (num <> 0) then begin
        dig:= num MOD 10;
        num:= num DIV 10;
        imprimirDigitos (num);
        writeln (dig);
     end;
end;


{******* PROGRAMA PRINCIPAL ********}

var
   n: integer;

begin
     write('Ingrese un numero: ');
     readln(n);
     while (n <> 0) do begin
           imprimirDigitos (n);
           writeln('');
           write('Ingrese un numero: ');
           readln(n);
     end;
     write('**** FIN DEL PROGRAMA ****');
     readln;
end.
