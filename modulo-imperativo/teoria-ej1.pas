{
EJERCITACI�N:
1) Realice un m�dulo que genere y devuelva un arreglo de enteros.
La carga del arreglo debe realizarse hasta que se lee el n�mero 0
o se hayan le�do 20 n�meros.

2) Realice un m�dulo que reciba un arreglo e imprima todo su contenido.

3) Realice un m�dulo que reciba un arreglo y un valor num, y de ser
posible elimine del arreglo el valor num.

4) Realice un m�dulo que genere una lista de enteros de manera aleatoria
hasta leer el n�mero 15. Se sugiere que la funci�n random genere n�meros
entre 0 y 15. Los elementos deben quedar almacenados en la lista en el
mismo orden en que fueron le�dos.
}

program teoria1;

const
    dimF = 20;

type
    lista = ^nodo;
    nodo = record
           num: integer;
           sig: lista;
           end;
    arreglo = array [1..dimF] of integer;


{********************************************}
{                  M�DULO 1                  }
{********************************************}

procedure generarArreglo (var v: arreglo; var dimL: integer);
var
   n: integer;
begin
     dimL:= 0; // !! Para contemplar el caso de que no entre en el primer n
     writeln ('Ingrese un numero');
     readln (n);
     while (n <> 0) and (dimL <= dimF) do
     begin
          dimL:= dimL + 1;
          v[dimL]:= n;
          writeln ('Ingrese un numero');
          readln (n);
     end;
end;


{********************************************}
{                  M�DULO 2                  }
{********************************************}

procedure imprimirArreglo (v: arreglo; dimL: integer);
var
   i: integer;
begin
     for i:=1 to dimL do
         writeln ('Numero ', i,': ',v[i]);
end;


{********************************************}
{                  M�DULO 3                  }
{********************************************}

procedure eliminarNum (var v: arreglo; n: integer; dimL: integer);
var
   pos: integer;
   i: integer;
begin
     pos:= 1;
     // b�squeda:
     while (pos <= dimL) and (n <> v[pos]) do
           pos:= pos + 1;
     // si se encuentra, borrar:
     if (n = v[pos]) then
        for i:= pos + 1 to dimL do
            v[i-1]:= v[i]
     else writeln ('No se encontr� la posici�n');
     dimL:= dimL - 1;
end;

{********************************************}
{                  M�DULO 4                  }
{********************************************}


var
   dimL: integer;
   arrEnteros: arreglo;

begin

end.
