{
1. El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
cada oficina se ingresa el código de identificación, DNI del propietario y valor de la
expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se
procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación
de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación
de la oficina.
}


program ejercicio1-repaso;
const
     dimF = 300;
type
    ofi = record
        cod: integer;
        dni: integer;
        expensas: real;
        end;
    vOfi = array [1..dimF] of ofi;

{generar vector}
procedure leerOfi (o: ofi)
begin
     writeln('Ingrese codigo de identificacion');
     readln(o.cod);
     if (o.cod <> -1) then begin
        writeln('Ingrese DNI de l* propietari*');
        readln(o.dni);
        writeln('Ingrese valor de las expensas');
        readln(o.expensas);
     end;
end;

procedure cargarVector (var v: vOfi; var dimL: integer);
var
   o: ofi;
begin
     leerOfi(o);
     while (o.cod <> -1) and (dimL < dimF) begin
           dimL:= dimL + 1;
           v[dimL]:= o;
           leerOfi(o);
     end;
end;


{ordenar por inserción}
procedure ordenarPorCodInsercion(var v: oficinas, dimL: integer);
var
   i, j: integer;
   o: ofi;   // tipo de elemento (en este caso un registro de vector)
begin
     for i:= 2 to dimL do begin
         o:= v[i];
         j:= i-1;
         while (j > 0) and (v[j].cod > o.cod) do begin
               v[j+1]:= v[j];
               j:= j-1;
         end;
         v[j+1]:= o;
     end;
end;

{ordenar por selección}
procedure ordenarPorCodSeleccion(var v: oficinas, dimL: integer);
var
   i, j, p: integer;
   o: ofi;
begin
     for i:= 1 to dimL-1 do begin
         p:= i;
         for j:= i+1 to dimL do
             if (v[j].cod < v[p].cod) then p:= j;
         o:= v[p]:
         v[p]:= v[i];
         v[i]:= o;
     end;
end;


{PROGRAMA PRINCIPAL}

var
   oficinas: vOfi;
   dimL: integer;

begin
     dimL:= 0;
     cargarVector(oficinas);
     ordenarPorCodInsercion(oficinas, dimL);
     ordenarPorCodSeleccion(oficinas, dimL);
end.
