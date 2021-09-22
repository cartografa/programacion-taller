var
  posMin:integer;
Begin
  min := 'ZZZ';
  posMin:= 0;
  for i:= 1 to cantE do
    if ((todos[i] <> nil) and (todos[i]^.dato < min)) then begin
      min:= todos[i]^.dato;
      posMin:= i;
    end;
  if (posMin <> 0) then
    todos[posMin]:=todos[posMin]^.sig;
end;



program punto1;
const
  dimF = 4;
type
		cadena = string[20];
		gasto = record
Procedure minimo(var todos:estantes; var min:string);
			nombreGasto: cadena;
			montoGasto: real;
		end;

		lista = ^nodo;
		nodo = record
			dato: gasto;
			sig: lista;
		end;
		
		arbolG = ^nodoA;
		nodoA = record
			dato: gasto;
			hi: arbolG;
			hd: arbolG;
		end;

		vGastos = array [1..dimF] of lista;

//------------------------------------------------------------//
procedure inicializarVectorListas(var v: vGastos);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;

//------------------------------PUNTO A------------------------------//
procedure cargarVectorListas(var v: vGastos);

	procedure leerGasto(var g: gasto);
	begin
		with g do begin
			write('INGRESE EL NOMBRE DEL GASTO: ');
			readln(nombreGasto);
			if(nombreGasto <> 'ZZ') then begin
				write('INGRESE EL MONTO DEL GASTO: ');
				readln(montoGasto);
				writeln();
			end;
		end;
	end;

	procedure insertarOrdenado(var l: lista; g: gasto);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.dato:= g;
		ant:= l;
		act:= l;
		while((act <> nil) and (g.nombreGasto > act^.dato.nombreGasto)) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(ant = act) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;

var
	i: integer;
	g: gasto;
begin
	for i:= 1 to dimF do begin
		writeln();
		writeln('SE LEEN LOS GASTOS DEL INTEGRANTE ', i, ' DE LA FAMILIA');
		leerGasto(g);
		while(g.nombreGasto <> 'ZZ') do begin
			insertarOrdenado(v[i], g);
			leerGasto(g);
		end;
	end;
end;

procedure imprimirVectorListas(v: vGastos);
var
	i: integer;
begin
	writeln('SE IMPRIMEN LOS GASTOS DE CADA INTEGRANTE DE LA FAMILIA');
	writeln();
	for i:= 1 to dimF do begin
		if(v[i] <> nil) then begin
			writeln('EL INTEGRANTE ', i, ' TIENE LOS SIGUIENTES GASTOS');
			while(v[i] <> nil) do begin
				writeln('NOMBRE: ', v[i]^.dato.nombreGasto);
				writeln('MONTO: ', v[i]^.dato.montoGasto:2:2);
				writeln();
				v[i]:= v[i]^.sig;
			end;
		end
		else begin
			writeln('EL INTEGRANTE DE LA FAMILIA ', i, ' NO TIENE GASTOS.');
			writeln();
		end;
	end;
end;

Procedure minimo (var v:vGastos; var nomMin:cadena; var monto:real);
Var
 indiceMin,i:integer;
Begin
  nomMin:= 'ZZZ'; 
  indiceMin:= -1;
  for i:= 1 to dimF do
     if (v[i] <> nil) and (v[i]^.dato.nombreGasto <= nomMin) then begin
	   indiceMin:= i;
  	   nomMin:= v[i]^.dato.nombreGasto;  
     end; 
  if (indiceMin <> -1) then begin
      monto:= v[indiceMin]^.dato.montoGasto;
      v[indiceMin]:= v[indiceMin]^.sig;
  end;
End;

procedure agregarAtras(var gNuevo, ult: lista; nombre:string; monto:real);
	var
		nue: lista;
	begin
		new(nue);
		//...
		gNuevo:= nue;
	end;

procedure merge(v:vGastos; var gNuevo:lista);
var
  ult:lista;
  minNombre, actual: cadena;
  monto, montoTotal:real;
begin
  gNuevo:= nil;
  minimo (v,minNombre, monto);
  while (minNombre <> 'ZZZ') do
    begin
     actual:= minNombre; 
     montoTotal:=0;
     while (minNombre = actual) do 
     begin
        montoTotal:= montoTotal + monto;
        minimo(v,minNombre,monto);
     end;
     agregarAtras(gNuevo, ult, actual,montoTotal);
    end;
end;  

// lNueva ordenada por nombre de gasto ascendentemente
// a ordenado por monto
procedure generarArbol(var a:arbolG; lNueva:lista);
begin
  while (lNueva <> nil) do begin
    insertarEnArbol(a, lNueva^.dato);
    lNueva:= lNueva^.sig;
  end;
end;
         

//------------------------------PROGRAMA PRINCIPAL------------------------------//
var
	vector: vGastos;
	lNueva: lista;
begin
	lNueva:= nil;
	inicializarVectorListas(vector);

//------------------------------PUNTO A------------------------------//
	cargarVectorListas(vector);

	writeln();

	imprimirVectorListas(vector);


//------------------------------------------------------------//
	writeln();
	
	merge(vector, lNueva);
	
	writeln();
	
	generarArbol(arbol, lNueva);

	write('PRESIONE ENTER PARA CERRAR EL PROGRAMA');
	readln();
end.
