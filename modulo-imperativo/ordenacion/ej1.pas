{
El administrador de un edificio de oficinas cuenta, en papel, con la informaci�n del pago de
las expensas de dichas oficinas.
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
cada oficina se ingresa el c�digo de identificaci�n, DNI del propietario y valor de la
expensa. La lectura finaliza cuando se ingresa el c�digo de identificaci�n -1, el cual no se
procesa.
b. Ordene el vector, aplicando el m�todo de inserci�n, por c�digo de identificaci�n
de la oficina.
c. Ordene el vector aplicando el m�todo de selecci�n, por c�digo de identificaci�n
de la oficina.
}


program ej1;

const
     dimF = 300;

type
    oficina = record
             cod: integer;
             dni: integer;
             valor: real;
             end;
    vOficinas = array [1..dimF] of oficina;



{***************************************************}
{               (a) CARGA DEL VECTOR                }
{***************************************************}

// lectura de registro
procedure leerDato (var dato: oficina);
begin
     writeln ('Ingrese c�digo de oficina:');
     readln (dato.cod);
     while (dato.cod <> -1) do begin
           writeln ('Ingrese DNI de propietarix:');
           readln (dato.dni);
           writeln ('Ingrese el valor de las expensas:');
           write('$'); readln (dato.valor);
     end;
end;

procedure cargarVector (var v: vOficinas; var dimL: integer);
var
   dato: oficina;
begin
     dimL:= 0;
     leerDato (dato);
     while (dato.cod <> -1) and (dimL < dimF) do begin
           dimL:= dimL + 1;
           v[dimL]:= dato;
           leerDato (dato);
     end;
end;



{***************************************************}
{           (b) ORDENACI�N POR INSERCI�N            }
{***************************************************}

procedure ordInsercion (var v: vOficinas; dimL: integer);
var
   i, j: integer;
   dato: oficina;
begin
     for i:= 2 to dimL do begin
         dato:= v[i];
         j:= i - 1;
         while (j > 0) and (v[j].cod > dato.cod) do begin
               v[j+1]:= v[j];
               j:= j - 1;
         end;
         v[j+1]:= dato;
     end;
end;



{***************************************************}
{           (c) ORDENACI�N POR SELECCI�N            }
{***************************************************}

procedure ordSeleccion (var v: vOficinas; dimL: integer);
var
   i, j, p: integer;
   dato: oficina;
begin
     for i:= 1 to dimL-1 do begin
         p:= i;
         for j:= i+1 to dimL do
             if (v[j].cod < v[p].cod) then p:= j;
         dato:= v[p];
         v[p]:= v[i];
         v[i]:= dato;
     end;
end;


{***************************************************}
{             IMPRIMIR C�DIGOS (p/ testeo)          }
{***************************************************}

procedure imprimir (v: vOficinas; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         writeln('El codigo de la posicion ', i, ' es ', v[i].cod);
end;

{***************************************************}
{                PROGRAMA PRINCIPAL                 }
{***************************************************}

var
   oficinas: vOficinas;
   dimL: integer;

begin
     cargarVector (oficinas, dimL);
     ordSeleccion (oficinas, dimL);
     writeln('***********************************************');
     readln;
end.
