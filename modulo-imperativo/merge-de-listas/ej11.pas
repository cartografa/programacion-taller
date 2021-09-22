{
Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada
película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado
por las críticas.
Implementar un programa que contenga:
a. Un módulo que lea los datos de películas y los almacene ordenados por código de
película y agrupados por código de género, en una estructura de datos adecuada. La
lectura finaliza cuando se lee el código de película -1.
b. Un módulo que reciba la estructura generada en el punto a y retorne una
estructura de datos donde estén todas las películas almacenadas ordenadas por código de
película.
}


program ej11;

type
    g = 1..8;
    pelicula = record
             cod: integer;
             genero: g;
             puntaje: real;
             end;

    lista = ^nodo;
    nodo = record
         dato: pelicula;
         sig: lista;
         end;

    peliGeneros = array [g] of lista;
    inicios = array [g] of lista;

{**********************************************}

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

procedure insertarOrdenado (var l: lista; peli: pelicula);
var
	aux, ant, act: lista;
begin
	act:= l;
	ant:= act;
	while (act <> nil) and (act^.dato.codigo < peli.codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	
	new (aux);
    aux^.dato:= dato;
	
	if (ant = act) then begin  //primero de la lista, o lista vacía
		aux^.sig:= l;
		l:= aux;
	end 
	else begin
		ant^.sig:= aux;
		aux^.sig:= act;
	end;
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


{************* MERGE DE LISTAS ****************}

procedure agregarAtras


procedure minimo (todos,



{************* PROGRAMA PRINCIPAL **************}

var
   vector: peliGeneros;

begin
     inicializarListas (vector);
     cargarVector (vector);

end.
