{
Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2021. De cada película se conoce: código de película, código de género (1:
acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
y puntaje promedio otorgado por las críticas.
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por
código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee
el código de la película -1.
b. Una vez almacenada la información, genere un vector que guarde, para cada
género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de
los dos métodos vistos en la teoría.
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el
código de película con menor puntaje.
}

program ej2;

type
    subrango = 1..8;

    peli = record
           cod: integer;
           genero: subrango;
           puntaje: real;
    end;

    masPuntaje = record
                cod: integer;
                puntaje:real;
                end;

    lista = ^nodo;
    nodo = record
           dato: peli;
           sig: ^lista;
           end;

    peliculas = array [subrango] of lista;
    puntajes = array [subrango] of masPuntaje;



{*****************************************************}
{                (a) CARGA DEL VECTOR                 }
{*****************************************************}


procedure inicializarListas (var v: peliculas);
var
   i: integer;
begin
     for i:= 1 to 8 do v[i]:= nil;
end;


procedure leerPeli (var p: peli);
begin
     writeln('Ingrese codigo de la película');
     readln(p.cod);
     writeln('Ingrese su género');
     readln(p.genero);
     writeln('Ingrese su puntaje');
     readln(p.puntaje);
end;


procedure agregarAtras (var L: lista; d: peli);
var
   aux, act: lista;
begin
     new (aux);
     aux^.dato:= d;
     aux^.sig:= nil;
     if (l <> nil) then begin
        act:= l;
        while (act^.sig <> nil) do
              act:= act^.sig;
        act^.sig:= aux;
     end
        else l:= aux;
end;


procedure cargarVector (var v: peliculas);
var
   i: integer;
   dato: peli;
begin
     inicializarListas (v);
     leerPeli (dato);
     while (dato.cod <> -1) do begin
           agregarAtras (v[dato.genero], dato);
           leerPeli (dato);
     end;
end;


{*****************************************************}
{ (b) Vector con peli de mayor puntaje en cáda género }
{*****************************************************}

// proceso por si no existen películas de algún género
procedure inicializarVector (var v: puntajes);
var
   i: integer;
begin
     for i:= 1 to 8 do begin
         v[i].cod:= -1;
         v[i].puntaje:= -1;
     end;
end;

procedure generarVector (listas: peliculas; var v: puntajes);
var
   i: integer;
   auxP: real;
   auxC: integer;
begin
     auxP:= -1;
     inicializarVector (v);
     for i:= 1 to 8 do begin
         while (listas[i] <> nil) do begin
               if (listas[i]^.dato.puntaje > auxP) then
                  auxP:= listas[i]^.dato.puntaje;
                  auxC:= listas[i]^.dato.cod;
               listas[i]:= listas[i]^.sig;

         end;
         v[i].cod:= auxC;
         v[i].puntaje:= auxP;
     end;
end;

{***************************************************}
{           (c) ORDENACIÓN POR INSERCIÓN            }
{***************************************************}

procedure ordenacionInsercion (var v: puntajes);
var 
	i, j, actual: masPuntaje;
begin
	for i:= 2 to 8 do begin
   		actual:= v[i];
   		j:= i - 1;
   		while (j > 0) and (v[j].puntaje > actual.puntaje) do begin
     			v[j+1]:= v[j];
     			j:= j - 1;
     		end;
		v[j+1]:= actual;
	end;
end;


{***************************************************}
{          (d)  IMPRIMIR MAYOR Y MENOR              }
{***************************************************}

procedure imprimir (v: puntajes);
begin
     writeln('La película con mayor puntaje fue ', v[8].cod, ' con ', v[8].puntaje);
     writeln('La película con menor puntaje fue ', v[1].cod, ' con ', v[1].puntaje);
end

{***************************************************}
{                PROGRAMA PRINCIPAL                 }
{***************************************************}

var
   catalogo: peliculas;
   mejoresPelis: puntajes;

begin
     cargarVector (catalogo);
     generarVector (catalogo, mejoresPelis);
     ordenacionInsercion (mejoresPelis);
     imprimir (mejoresPelis);
end.
