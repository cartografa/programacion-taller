{
Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa modularizado que:

       a. Lea los datos de los productos y los almacene ordenados por código de producto y
    agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos
    finaliza cuando se lee el precio 0.
    Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

       b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
    Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
    productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
    ignore el resto.

       c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de
    los dos métodos vistos en la teoría.

       d. Muestre los precios del vector ordenado.
}


program ej3;

type
    subrango = 1..8;

    prod = record
           rubro: subrango;
           cod: integer;
           precio: real;
           end;

    lista = ^nodo;
    nodo = record
           dato: prod;
           sig: lista;
           end;

    prods = array [subrango] of lista;
    rubro3 = array [1..30] of prod;


{*****************************************************}
{              (a) CARGA DE PRODUCTOS                 }
{*****************************************************}

procedure inicializarListas (var v: prods);
var
   i: integer;
begin
     for i:= 1 to 8 do v[i]:= nil;
end;


procedure leerProd (var p: prod);
begin
     writeln ('Ingrese precio de producto: ');
     readln (p.precio);
     if (p.precio <> 0) then begin
        writeln ('Ingrese rubro del producto: ');
        readln (p.rubro);
        writeln ('Ingrese codigo del producto: ');
        readln (p.cod);
     end;
end;


procedure agregarAdelante (var l: lista; p: prod);
var
	nue: lista;
begin
	new (nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;


procedure cargarProductos (var v: prods);
var
   p: prod;
begin
     inicializarListas (v);
     leerProd (p);
     while (p.precio <> 0) do begin
           agregarAdelante (v[p.rubro], p);
           leerProd (p);
     end;
end;

procedure imprimirProductos (v: prods);
var
   i: integer;
begin
     for i:= 1 to 8 do begin
         while (v[i] <> nil) do
               writeln ('Rubro ', i,': producto con codigo ', v[i]^.dato.cod);
     end;
end;


{*****************************************************}
{        (a) VECTOR CON PRODUCTOS DE RUBRO 3          }
{*****************************************************}

procedure generarVector (var v: rubro3; var dimL: integer; l: lista);
begin
     dimL:= 0;
     while (l <> nil) and (dimL < 30) do begin
           dimL:= dimL + 1;
           v[dimL]:= l^.dato;
           l:= l^.sig;
     end;
end;


{*****************************************************}
{        (c)  ORDENAR POR PRECIO EL VECTOR            }
{*****************************************************}

procedure ordenInsercion (var v: rubro3; dimL: integer);
var 
	i, j: integer;
    actual: prod;
begin
	for i:= 2 to dimL do begin
   		actual:= v[i];
   		j:= i-1;
   		while (j > 0) and (v[j].precio > actual.precio) do
        begin
     			v[j+1]:=v[j];
     			j := j-1;
   		end;
		v[j+1]:= actual;
	end;
end;


{*****************************************************}
{        (d) IMPRIMIR PRECIOS ORDENADOS               }
{*****************************************************}

procedure imprimirPrecios (v: rubro3; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         writeln('El precio en la posicion ', i, ' es $', v[i].precio:2:2);
end;


{*****************************************************}
{                  PROGRAMA PRINCIPAL                 }
{*****************************************************}

var
   vProductos: prods;
   vRubro3: rubro3;
   dimL: integer;

begin
     cargarProductos (vProductos);
     imprimirProductos (vProductos);
     writeln ('*********************************');
     generarVector (vRubro3, dimL, vProductos[3]);
     imprimirPrecios (vRubro3, dimL);
     writeln ('*********************************');
     readln;
end.
