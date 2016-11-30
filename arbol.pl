%hombre(nombre)/1
%
hombre(domingo).
hombre(carlos).
hombre(benito).
hombre(ramses).
hombre(mario).
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
edad(belem,17).
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
padres(ns,belem,andres).
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

%hermana(El,Quien):-mujer(El),(papa(Alguien,El);mama(Alguien,El)),(papa(Alguien,Quien);mama(Alguien,Quien)),El\=Quien.
% hermano(El,Quien):-hombre(El),(papa(Alguien,El);mama(Alguien,El)),(papa(Alguien,Quien);mama(Alguien,Quien)),El\=Quien.

hermano(El,Quien):- hombre(El),padres(P1,P2,El),(padres(P1,P2,Quien);padres(P2,P1,Quien)),El\=Quien.
hermana(Ella,Quien):- mujer(Ella),padres(P1,P2,Ella),(padres(P1,P2,Quien);padres(P2,P1,Quien)),Ella\=Quien.

esposo(El,Quien):-hombre(El),mujer(Quien),esposos(El,Quien).
esposa(El,Quien):-mujer(El),hombre(Quien),(esposos(El,Quien);esposos(Quien,El)).

abuela(Ella,Quien):-mujer(Ella),(padres(Ella,_,Alguien);padres(_,Ella,Alguien)),(padres(_,Alguien,Quien);padres(Alguien,_,Quien)).

abuelo(El,Quien):-hombre(El),padres(El,_,Alguien),(padres(_,Alguien,Quien);padres(Alguien,_,Quien)).

nieto(El,Quien):- hombre(El),(abuelo(Quien,El);abuela(Quien,El)).
nieta(Ella,Quien):-mujer(Ella),(abuelo(Quien,Ella);abuela(Quien,Ella)).

%hermano(x,y):-hombre(X),papa(Z,X),mama(Z,Y),X\=Y.
%hermana(X,Y):-mujer(X),papa(Z,X),mama(Z,Y),X\=Y.

tio(X,Y):-padres(Z,W,Y),(hermano(X,Z);hermano(X,W)).
tia(X,Y):-padres(Z,W,Y),(hermana(X,Z);hermana(X,W)).
tio(X,Y):-esposo(X,W),hermana(W,Z),(papa(Z,Y);mama(Z,Y)).
tia(X,Y):-esposa(X,W),hermano(W,Z),(papa(Z,Y);mama(Z,Y)).

primo(X,Y):-(tio(W,Y);tia(W,Y)),hijo(X,W).
prima(X,Y):-(tia(W,Y);tia(W,Y)),hija(X,W).

sobrino(X,Y):-hombre(X),(tio(Y,X);tia(Y,X)).
sobrina(X,Y):-mujer(X),(tio(Y,X);tia(Y,X)).

cuñado(X,Y):-esposo(X,W),hermana(W,Y).
cuñada(X,Y):-esposa(X,W),hermano(W,Y).

menor(Y):-edad(Y,Z), Z<18.
mayor(Y):- edad(Y,Z),Z>=18.

concuño(EL,QUIEN):-esposo(EL,ELLA),(esposo(QUIEN,MAR);esposa(QUIEN,MAR)),hermana(ELLA,MAR).
concuña(Ella,Quien):-esposa(Ella,El),(esposo(Quien,Mar);esposa(Quien,Mar)),hermano(El,Mar).
