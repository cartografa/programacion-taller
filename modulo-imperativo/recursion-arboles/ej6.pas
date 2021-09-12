{
Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
}


program ej6;

type
    indice = 1..20;
    vector = array [indice] of integer;

procedure generarVector (var v: vector; var fin: indice);
var
   i: integer;
begin
     for i:= 1 to 20 do v[i]:= Random(100);
     fin:= 20;
end;


procedure busquedaDicotomica (v: vector; ini, fin: indice; dato: integer; var pos: indice);

begin
     pos:= (ini + fin) div 2;  // la posicion es el medio del vector
     if (dato = v[pos])
        then busquedaDicotomica:= pos;
     else if (ini <= sup) then begin
          if (a < v[pos]) then fin:= pos -1
                          else ini:= pos + 1;
          busquedaDicotomica (v, ini, fin, dato, pos)
     end
        else busquedaDicotomica:= -1;
     //while (ini <= fin) and (dato <> v[pos]) do begin
     //      if (dato < v[pos]) then fin:= pos - 1  // se queda la primera parte
     //                       else ini:= pos + 1; // se queda con la segunda parte
     //      pos:= (ini + fin) div 2; // vuelve a calcular el medio del vector
     // end;
     // if (ini > fin) then pos:= -1; // no encontró el dato
end;


{********* PROGRAMA PRINCIPAL ***********}

var
   v: vector;
   x: integer;
   ini, fin, pos: indice;

begin
     generarVector (v, fin);
     writeln ('Ingrese un numero para buscar en el vector: ');
     readln (x);
     writeln ('');
     ini:= 1;
     busquedaDicotomica (v, ini, fin, x, pos);
     if (pos <> -1) then
        writeln ('El numero ', x,' se escuentra en la posicion ', pos)
     else
         writeln ('El numero ', x,' no se encuentra en el vector');
     readln;
end.




