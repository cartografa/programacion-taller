{
ALGORITMOS
}

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


{MERGE DE VARIAS LISTAS CON AGREGAR ATRÁS Y PUNTERO AL ÚLTIMO}
procedure Merge ( var eN: lista; e: estantes);

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
  

{PROGRAMA DEL MERGE}
var min: libro; ult: lista;
begin
  eN:= nil;
  Minimo (e, min);
  while (min.titulo <> â€˜ZZZâ€™) do
    begin
     agregarAtras (eN, ult, min);
     Minimo (e,min);
    end;
End;  


{PROGRAMA PRINCIPAL}
var e: estantes; eNuevo: lista;
begin
  ArmarEstantes (e);
  Merge (eNuevo, e)
end.



{cargar un vector de listas ordenado}

procedure inicializarListas (var v: peliGeneros);
var
   i: integer;
begin
     for i:= 1 to 8 do v[i]:= nil;
end;

procedure leerPeli (var p: pelicula);
begin
     writeln ('Ingrese codigo de la pelicula: ');
     readln (p.cod);
     if (p.cod <> -1) then begin
        writeln ('Ingrese genero de la pelicula: ');
        readln (p.genero);
        writeln ('Ingrese puntaje de la pelicula: ');
        readln (p.puntaje);
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

	while (act <> nil) and (act^.dato.cod < v.cod) do begin
		ant:= act;
		act:= act^.sig;
	end;

	if (ant = act) then l:= nue; {dato al principio / o lista vacía}
	               else ant^.sig:= nue; {dato va entre otros dos o al final}
    nue^.sig:= act;
end;

// Cargo vector de listas
procedure cargarVector (var v: peliGeneros);
var
   p: pelicula;
begin
     leerPeli (p);
     while (p.codigo <> -1) do begin
           insertarOrdenado (v[p.genero], p);
           leerPeli (p);
     end;
end;


{acumulador}
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
        while ((min.prod <> 999999) and (min.prod = act.prod) do begin {mientras sean el mismo prod}
              act.cant:= act.cant + min.cant; {sumo cant}
              minimo(v, min);
        end;
        agregarAtras(nueL, ult, act);
  end;
end;
