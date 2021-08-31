{
EJERCITACIÓN:
1) Realice un módulo que genere y devuelva un arreglo de enteros.
La carga del arreglo debe realizarse hasta que se lee el número 0
o se hayan leído 20 números.

2) Realice un módulo que reciba un arreglo e imprima todo su contenido.

3) Realice un módulo que reciba un arreglo y un valor num, y de ser
posible elimine del arreglo el valor num.

4) Realice un módulo que genere una lista de enteros de manera aleatoria
hasta leer el número 15. Se sugiere que la función random genere números
entre 0 y 15. Los elementos deben quedar almacenados en la lista en el
mismo orden en que fueron leídos.
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
{                  MÓDULO 1                  }
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
{                  MÓDULO 2                  }
{********************************************}

procedure imprimirArreglo (v: arreglo; dimL: integer);
var
   i: integer;
begin
     for i:=1 to dimL do
         writeln ('Numero ', i,': ',v[i]);
end;


{********************************************}
{                  MÓDULO 3                  }
{********************************************}

procedure eliminarNum (var v: arreglo; n: integer; dimL: integer);
var
   pos: integer;
   i: integer;
begin
     pos:= 1;
     // búsqueda:
     while (pos <= dimL) and (n <> v[pos]) do
           pos:= pos + 1;
     // si se encuentra, borrar:
     if (n = v[pos]) then
        for i:= pos + 1 to dimL do
            v[i-1]:= v[i]
     else writeln ('No se encontró la posición');
     dimL:= dimL - 1;
end;

{********************************************}
{                  MÓDULO 4                  }
{********************************************}


var
   dimL: integer;
   arrEnteros: arreglo;

begin

end.
