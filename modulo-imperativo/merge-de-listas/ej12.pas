{
Implementar un programa que procese la información de las ventas de productos de una
librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto
vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se
lee el código de sucursal 0.
Implementar un programa que:
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
en una estructura de datos adecuada.
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
una estructura donde esté acumulada la cantidad total vendida para cada código de
producto.
}


program ej12;
const
     dimF = 4;
type
    venta = record
          dia: 1..31;
          mes: 1..12;
          anio: 2000..3000;
          prod: integer;
          sucursal: 1..4;
          cant: integer;
          end;

     ventaPorProd = record
                  prod: integer;
                  cant: integer;
                  end;

     lista = ^nodo;
     nodo = record
          dato: venta;
          sig: lista;
          end;

     listaTotal = ^nodoTotal;
     nodoTotal = record
               dato: ventaPorProd;
               sig: listaTotal;
               end;

     sucursales = array [1..dimF] of lista

{******************************************************************}

{CARGAR DATOS}
procedure inicializarListas (var v: sucursales);
var
   i: integer;
begin
     for i:= 1 to dimF do v[i]:= nil;
end;

procedure leerVenta (var v: venta);
begin
     writeln ('Ingrese codigo de sucursal: ');
     readln (v.cod);
     if (v.cod <> 0) then begin
        {..............}
     end;
end;

procedure insertarOrdenado (var l: lista; v: venta);
var
	nue, ant, act: lista;
begin
	new (nue);
    nue^.dato:= v;
	act:= l;
	ant:= l;  {ubico los dos al principio de la lista}

	while (act <> nil) and (act^.dato.prod < v.prod) do begin
		ant:= act;
		act:= act^.sig;
	end;

	if (ant = act) then l:= nue {dato al principio / o lista vacía}
	               else ant^.sig:= nue; {dato va entre otros dos o al final}
    nue^.sig:= act;
end;

// Cargo vector de listas
procedure cargarVector (var v: sucursales);
var
   dato: venta;
begin
     leerVenta (dato);
     while (dato.cod <> 0) do begin
           insertarOrdenado (v[dato.cod], dato);
           leerVenta (dato);
     end;
end;


{******************************************************************}

{AGREGAR ATRAS}
procedure agregarAtras (var l, ult: lista; dato: venta);
var
   nue: lista;
begin
    new(nue);
    nue^.dato:= dato;
    nue^.sig:= nil;
    if (l = nil) then l:= nue
                 else ult^.sig:= nue;
    ult:= nue;
end;
    
{MINIMO}
procedure minimo (var v: sucursales; var min: venta);
var
     i, posMin: integer;
begin
    min.prod:= 999999;
    for i:= 1 to dimF do
    begin
      if (v[i] <> nil) then
         if (v[i]^.dato.prod < min.prod) then begin
            min:= v[i]^.dato;
            posMin:= i; {guardo la posicion de donde saqué el mínimo}
         end;
    end;
    if (min.prod <> 999999) then v[posMin]:= v[posMin]^.sig {avanzo el puntero}
end;


{MERGE ACUMULADOR}
procedure mergeAcumulador (var nueL: listaTotal; v: sucursales);
var
   min: venta;
   act: ventaPorProd;
   ult: lista;
begin
  nueL:= nil;
  minimo (v, min);
  while (min.prod <> 999999) do begin
        act.prod:= min.prod;          {guardo el actual}
        act.cant:= 0;                {contador en 0}
        while ((min.prod <> 999999) and (min.prod = act.prod)) do begin {mientras sean el mismo prod}
              act.cant:= act.cant + min.cant; {sumo cant}
              minimo(v, min);
        end;
        agregarAtras(nueL, ult, act);
  end;
end;


{******************************************************************}

{PROGRAMA PRINCIPAL}
var
   suc: sucursales;
   ventas: listaTotal;
begin
     inicializarListas(suc);
     cargarVector(suc);
     mergeAcumulador(ventas, suc);
end.
