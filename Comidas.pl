%gusta/2 gusta(nombre,alimento)
%
gusta(hernesto,pastel_grande).
gusta(javier,pastel_grande).
gusta(berenice,pastel_grande).
gusta(samanta,pizza_grande).
gusta(ana,pizza).
gusta(maria,pizza).
gusta(jose,pizza).
gusta(ismael,pizza).
gusta(beto,pastel_chico).
gusta(jaime,pastel_chico).
gusta(carolina,pastel_chico).
gusta(natividad,pastel_chico).
gusta(ruth,helado).
gusta(vanesa,helado).
gusta(manuel,helado).

%edad/2 edad(nombre,edad)
%
edad(hernesto,26).
edad(javier,13).
edad(berenice,18).
edad(samanta,79).
edad(ana,6).
edad(maria,19).
edad(jose,37).
edad(ismael,35).
edad(beto,5).
edad(jaime,12).
edad(carolina,52).
edad(natividad,81).
edad(ruth,3).
edad(vanesa,16).
edad(manuel,18).

%tiene/2 tiene(nombre,dinero)7
%
tiene(hernesto,150).
tiene(javier,30).
tiene(berenice,230).
tiene(samanta,500).
tiene(ana,20).
tiene(maria,75).
tiene(jose,185).
tiene(ismael,200).
tiene(beto,15).
tiene(jaime,10).
tiene(carolina,93).
tiene(natividad,122).
tiene(ruth,12).
tiene(vanesa,50).
tiene(manuel,112).

%precio/2(alimento,precio).
%
precio(pastel_grande,25).
precio(pizza,30).
precio(pastel_chico,15).
precio(helado,8).

antojo(hernesto,miercoles).
antojo(javier,lunes).
antojo(berenice,lunes).
dia(domingo,miercoles).


datos:-write('\n Nombre:'),read(Nom),nl,edad(Nom,E),gusta(Nom,G),tiene(Nom,T),dia(Nom,D),write('Edad:'),write(E),write('a�os \n'),write('Gustos;'),write(G), nl,write('Presupuesto'),write(T),nl,write('Dia:'),write(D),pausa.
pausa:-nl,nl,write('Presione <Enter> para continuar...'),skip(10).
limpiar:-write('\033C2J').
pedidos:-limpiar,nl,write('Dia: '),read(Dia),dia(N,Dia),gusta(N,G),nl,write(N),write('__'),write(G),nl,fail.
pedidos:-pausa.
pedidos:-otra.
otra:-nl,write('Otra consulta?s/n'),read(Opc),otra(Opc).
otra(s):-pedidos.
otra(n):-pausa.
otra(_):-otra.
ventas:-limpiar,write('Nombre'),read(Nom),write('Cantidad: '),read(Cant),gusta(Nom,Que),precio(Que,Cuanto),Total is Cuanto* Cant, nl,nl,write('Pedido:\n'),tab(3),write(Que),write('$'),write(Cuanto),write('X'),write(Cant),nl,tab(3),write('Total:$'),write(Total),preg.
preg:-nl,nl,write('Otra venta?'),read(Resp),preg(Resp).
preg(s):-ventas.
preg(n).
preg(_):-preg.


pedidop:-write('Nombre'),read(Nom),write('Cantidad:'),read(Cant),veriPresup(Nom,Cant).
veriPresup(Nom,Cant):-gusta(Nom,Comida),tiene(Nom,Presup),precio((Comida,Costo)),Tot is Cant*Costo,Tot=<Presup,nl,write(Nom),nl,write(Comida),write(Cant),nl,write(Tot).

veriPresup(_,_):-write('Credito insuficiente'),otra.








