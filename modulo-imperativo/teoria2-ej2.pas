{
2. Realice un programa que lea n�meros hasta leer el valor 0 e imprima sus d�gitos
en el orden en que aparecen en el n�mero. Ejemplo si se lee el valor 256,
se debe imprimir 2  5  6.
}

program teoria2ej2;

procedure imprimirDigitos (n: integer);
var
   copia: integer;
begin
     copia:= n;
     if (n <> 0) then begin




var
   n: integer;

begin
     write('Ingrese un numero: ');
     readln(n);
     while (n <> 0) do begin
           imprimirDigitos (n)
           write('Ingrese un numero: ');
           readln(n);
     end;


end.
