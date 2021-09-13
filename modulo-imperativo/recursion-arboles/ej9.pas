{
Implemente un programa que invoque a un módulo que genere un árbol binario de
búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el
nombre ‘ZZZ’ que no debe procesarse. También debe invocar a otro módulo que reciba el
árbol generado y un nombre, y retorne verdadero si existe dicho nombre en el árbol o falso
en caso contrario.
}

program ej9;

type
    cadena30 = string[30];
    arbol = ^nodo;
    nodo = record
         dato: cadena30;
         HI: arbol;
         HD: arbol;
         end;

{**************** CARGAR ÁRBOL *****************}

procedure crear (var a: arbol; nom: cadena30);
begin
     if (a = nil) then begin
        new (a);
        a^.dato:= nom;
        a^.HI:= nil;
        a^.HD:= nil;
     end
     else
         if (nom < a^.dato) then
            crear (a^.HI, nom)
         else
            crear (a^.HD, nom);
end;

{************* BUSCAR NOMBRE EN ABB *************}

procedure buscar (a: arbol; x: cadena30; var ok: boolean);
begin
        if (a = nil) then
           ok:=false
        else
            if (a^.dato = x) then
                    ok:= true
            else begin
                buscar (a^.HI, x, ok);
                if (not ok) then
                      buscar (a^.HD, x, ok)
            end;
end;


{************** PROGRAMA PRINCIPAL **************}

var
   a: arbol;
   nom: cadena30;
   dato: cadena30;
   ok: boolean;

begin
     a:= nil;
     write ('Ingrese nombre: ');
     readln (nom);
     while (nom <> 'ZZZ') do begin
         crear (a, nom);
         write ('Ingrese nombre: ');
         readln (nom);
     end;
     write ('Ingrese un nombre a buscar: ');
     readln (dato);
     buscar (a, dato, ok);
     if (ok = false) then
        writeln ('El nombre no se encuentra en el arbol')
     else
         writeln ('El nombre se encuentra en el arbol');
     writeln ('');
     readln;
end.
