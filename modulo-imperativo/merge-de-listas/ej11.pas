{
Un cine posee la lista de pel�culas que proyectar� durante el mes de octubre. De cada
pel�cula se conoce: c�digo de pel�cula, c�digo de g�nero (1: acci�n, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: b�lica, 7: documental y 8: terror) y puntaje promedio otorgado
por las cr�ticas.
Implementar un programa que contenga:
a. Un m�dulo que lea los datos de pel�culas y los almacene ordenados por c�digo de
pel�cula y agrupados por c�digo de g�nero, en una estructura de datos adecuada. La
lectura finaliza cuando se lee el c�digo de pel�cula -1.
b. Un m�dulo que reciba la estructura generada en el punto a y retorne una
estructura de datos donde est�n todas las pel�culas almacenadas ordenadas por c�digo de
pel�cula.
}


program ej11;
const
     dimF = 8;

type
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

    peliGeneros = array [1..dimF] of lista;

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
	
	if (ant = act) then begin  //primero de la lista, o lista vac�a
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

procedure agregarAtras (var l, ult: lista; peli: pelicula);
var
   nue: lista;
begin
     new(nue);
     nue^.dato:= peli;
     nue^.sig:= nil;
     if (l = nil) then l:= nue;
                  else ult^.sig:= nue;
     ult:= nue; // actualizo puntero al �ltimo
end;

procedure minimo (var v: peliGeneros; var min: pelicula);
var
   i, posMin: integer;
begin
     min.cod:= 99999999;
     for i:= 1 to dimF do begin
         if (v[i] <> nil) then
            if (e[i]^.dato.cod < min.cod) then begin
               min:= v[i]^.dato;
               posMin:= i;
            end;
     end;
     if (min.cod <> 99999999) then
        v[posMin]:= v[posMin]^.sig; //adelanto el puntero del m�nimo
end;

procedure merge (var nueL: lista; v: peliGeneros);
var
   min: pelicula;
   ult: lista;
begin
     nueL:= nil;
     minimo(v, min);
     while (min.cod <> '99999999') do begin
           agregarAtras(nueL, ult, min);
           minimo(v, min);
     end;
end;



{************* PROGRAMA PRINCIPAL **************}

var
   vector: peliGeneros;
   nuevaLista: lista;

begin
     inicializarListas (vector);
     cargarVector (vector);
     merge (nuevaLista, vector);
end.
