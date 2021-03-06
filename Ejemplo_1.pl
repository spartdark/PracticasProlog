% fruta(Nombre). fruta/1
%
fruta(manzana).
fruta(aguacate).
fruta(naranja).
fruta(uva).
fruta(melon).

% verdura(Nombre). verdura/1
%
verdura(cebolla).
verdura(lechuga).
verdura(pepino).
verdura(zanahoria).
verdura(brocoli).

% color(Nombre, Color). color/2
%
color(manzana,verde).
color(aguacate,verde).
color(naranja,naranja).
color(uva,morado).
color(melon,naranja).
color(cebolla,blanco).
color(lechuga,verde).
color(pepino,verde).
color(zanahoria,naranja).
color(brocoli,verde).






% ni�a(Nombre). ni�a/1
%
ni�a(ana).
ni�a(claudia).
ni�a(bere).
ni�a(luz).
ni�a(carmen).

% ni�o(Nombre). ni�o/1
%
ni�o(pepe).
ni�o(beto).
ni�o(raul).
ni�o(memo).

% tiene(Nombre, Objeto). tiene/2
%
tiene(ana,yoyo).
tiene(ana,mu�eca).
tiene(ana,libro).
tiene(claudia,mu�eca).
tiene(bere,bici).
tiene(bere,libro).
tiene(bere,cuerda).
tiene(luz,yoyo).
tiene(pepe,bici).
tiene(pepe,cuerda).
tiene(raul,libro).
tiene(memo,yoyo).
tiene(memo,bici).

%mujer(Nombre). mujer/1
%
%mujer(ana).
%mujer(brenda).
%mujer(lucy).
%mujer(karla).
% hombre(Nombre).hombre/1
%
hombre(paco).
hombre(veto).
hombre(luis).
hombre(tomas).
hombre(jose).
%clase(Clave,Materia).clase/2
%
clase(1,matematicas).
clase(2,espa�ol).
clase(3,programacion).
clase(4,ingles).
%inscrito(Clave,Nombre,Calif).inscrito/3
%
inscrito(1,ana,10).
inscrito(2,ana,8).
inscrito(4,ana,6).
inscrito(2,brenda8).
inscrito(3,brenda,5).
inscrito(3,lucy,6).
inscrito(1,karla,5).
inscrito(3,karla,7).
inscrito(4,karla,10).
inscrito(2,beto,8).
inscrito(2,luis,5).
inscrito(3,luis,10).
inscrito(2,jose,2).
inscrito(1,jose,6).

%entrada (nombre)/1
%
entrada(arroz).
entrada(sopa).
entrada(consome).

%carne (nombre)/1
%
carne(filete_de_cerdo).
carne(pollo_asado).
carne(bisteck).

%pescado(nombre)/1
%

pescado(mojarra).
pescado(atun).
pescado(salmon).

%postre/1
%
postre(flan).
postre(naranja).
postre(nuecez_con_miel).

%bebiba(nombre)/1
%
bebida(vino).
bebida(cerveza).
bebida(agua_mineral).

%calorias (nombre,calorias/2
%
calorias(arroz,200).
calorias(sopa,150).
calorias(consome,300).
calorias(filete_de_cerdo,400).
calorias(pollo_asado,280).
calorias(boistec,320).
calorias(mojarra,160).
calorias(atun,300).
calorias(salmon,330).
calorias(flan,200).
calorias(naranja,50).
calorias(nuecez_con_miel,500).
calorias(vino,366).
calorias(cerveza,432).
calorias(agua_mineral,0).
calorias(zanahoria,5).
calorias(apio,5).
calorias(calabaza,3).
%vegetal (nombre)/1
%
vegetal(calabaza).
vegetal(apio).
vegetal(zanahoria).

plato_principal(X):-pescado(X);vegetal(X).

comida(E,P,T,B):-entrada(E),plato_principal(P),postre(T),bebida(B).
valor(E,P,T,B,C):-comida(E,P,T,B),calorias(E,C1),calorias(P,C2),calorias(T,C3),calorias(B,C4),C is C1+C2+C3+C4.
comida_equilibrada(E,P,T,B):-valor(E,P,T,B,C), C=<800.


%hombre(nombre)/1
%
hombre(domino).
hombre(carlos).
hombre(benito).
hombre(ramses).
hombre(mario).
hombre(ruben).
hombre(ruben).
hombre(gonzalo).
hombre(samuel).
hombre(ramon).
hombre(andres).

% mujer(nombre)/1

mujer(sonia).
mujer(ana).
mujer(daniela).
mujer(valeria).
mujer(karina).
mujer(leticia).
mujer(belem).
mujer(luz).

%edad(nombre,edad)/2
%
edad(domingo,78).
edad(sonia,68).
edad(ana,43).
edad(carlos,45).
edad(brenda,24).
edad(ruben,31).
edad(karime,20).
edad(ramon,38).
edad(leticia,39).
edad(daniela,18).
edad(benito,20).
edad(valeria,19).
edad(gonzalo,8).
edad(samuel,6).
edad(luz,19).
edad(belen,17).
edad(ramses,3).
edad(mario,1).
edad(andres,2).
%padres(padre,madre,hija)/3
%
padres(domingo,sonia,ana).
padres(domingo,sonia,brenda).
padres(carlos,ana,daniela).
padres(carlos,ana,benito).
padres(benito,valeria,ramses).
padres(benito,valeria,mario).
padres(domingo,sonia,ruben).
padres(domingo,sonia,ramon).
padres(ruben,karina,gonzalo).
padres(ruben,karina,samuel).
padres(ramon,leticia,luz).
padres(ramon,leticia,belen).
padres(ns,belen,andres).
%esposos(nombre,mujer)/2
%
esposos(domingo,sonia).
esposos(carlos,ana).
esposos(benito,valeria).
esposos(ruben,karina).
esposos(ramon,leticia).

papa(El,Quien):-hombre(El),(padres(El,_,Quien);padres(_,El,Quien)).
mama(Ella,Quien):-mujer(Ella),(padres(Ella,_,Quien);padres(_,Ella,Quien)).
hijo(El,Quien):-hombre(El),(papa(Quien,El);mama(Quien,El)).
hija(El,Quien):-mujer(El),(papa(Quien,El);mama(Quien,El)).
hermana(El,Quien):-mujer(El),(papa(Alguien,El);mama(Alguien,El)),(papa(Alguien,Quien);mama(Alguien,Quien)),El\=Quien.


hermano(El,Quien):-hombre(El),(papa(Alguien,El);mama(Alguien,El)),(papa(Alguien,Quien);mama(Alguien,Quien)),El\=Quien.
esposo(El,Quien):-hombre(El),mujer(Quien),(esposos(El,Quien);esposos(Quien,El)).
esposa(El,Quien):-mujer(El),hombre(Quien),(esposos(El,Quien);esposos(Quien,El)).
abuela(Abue,Sobrino):-mujer(Abue),padres(Papa,Mama,Sobrino),(mama(Abue,Mama);mama(Abue,Papa)).
abuelo(Abue,Sobrino):-hombre(Abue),padres(Papa,Mama,Sobrino),(mama(Mama,Ella);mama(Ella,Papa)).

nieto(El,Quien):- hombre(El),(abuelo(Quien,El);abuela(Quien,El)).
nieta(Ella,Quien):-mujer(Ella),(abuelo(Quien,X);abuela(Quien,X)).

hermano(x,y):-hombre(X),papa(Z,X),mama(Z,Y),X\=Y.
hermana(X,Y):-mujer(X),papa(Z,X),mama(Z,Y),X\=Y.

tio(X,Y):-padres(Z,W,Y),(hermano(X,Z);hermano(X,W)).
tia(X,Y):-padres(Z,W,Y),(hermana(X,Z);hermana(X,W)).
tio(X,Y):-esposo(X,W),hermana(W,Z),(papa(Z,Y);mama(Z,Y)).
tia(X,Y):-esposa(X,W),hermano(W,Z),(papa(Z,Y);mama(Z,Y)).

primo(X,Y):-(tio(W,Y);tia(W,Y)),hijo(X,W).
prima(X,Y):-(tia(W,Y);tia(W,Y)),hijo(X,W).

sobrino(X,Y):-hombre(X),(tio(Y,X);tia(Y,X)).
sobrina(X,Y):-mujer(X),(tio(Y,X);tia(Y,X)).

cu�ado(X,Y):-esposo(X,W),hermana(W,Y).
cu�ada(X,Y):-esposa(X,W),hermano(W,Y).

menor(Y):-edad(Y,Z), Z<18.
mayor(Y):- edad(Y,Z),Z>=18.

concu�o(EL,QUIEN):-esposo(EL,ELLA),(esposo(QUIEN,MAR);esposa(QUIEN,MAR)),hermana(ELLA,MAR).
concu�a(A,B):-esposa(A,Z),(esposo(B,W);esposa(B,W)),(hermano(W,Z),hermana(W,Z)).



































