persona(eduardo,hombre,17,28,enero).
persona(jose,hombre,18,26,febrero).
persona(ana,mujer,52,10,marzo).
persona(francisco,hombre,23,11,abril).
persona(david,hombre,12,18,mayo).
persona(miguel,hombre,23,15,agosto).
persona(vladimir,hombre,22,27,julio).
persona(veronica,mujer,23,12,septiembre).
persona(tania,mujer,24,25,septiembre).
persona(paulina,mujer,30,14,octubre).
persona(angel,hombre,32,16,noviembre).
persona(isamar,mujer,17,26,diciembre).
persona(sara,mujer,17,1,noviembre).
persona(diana,mujer,16,23,agosto).
persona(miriam,mujer,26,18,junio).
persona(juana,mujer,25,27,julio).

zodiaco(aries,21,marzo,20,abril).
zodiaco(tauro,21,abril,21,mayo).
zodiaco(geminis,22,mayo,21,junio).
zodiaco(cancer,22,junio,22,julio).
zodiaco(leo,23,julio,22,agosto).
zodiaco(virgo,23,agosto,22,septiembre).
zodiaco(libra,23,septiembre,22,octubre).
zodiaco(escorpio,23,octubre,22,noviembre).
zodiaco(sagitario,23,nov,21,diciembre).
zodiaco(capricornio,22,diciembre,20,enero).
zodiaco(acuario,21,enero,21,febrero).
zodiaco(picis,22,febrero,20,marzo).


signo(X,Y):-persona(X,_,_,W,Z),zodiaco(Y,A,B,C,D),((Z=B,W>=A);(Z=D,W=<C)).

mostrar:-signo(X,Y),write(X),nl,write(Y),nl,nl,fail.

pareja:-write('Ingresa un nombre__'),read(Nom),persona(Nom,Sex,Ed,_,_),signo(Nom,X),persona(A,B,C,_,_),signo(A,Y),Sex \= B ,C>=Ed,X=Y,nl,write('Usted puede salir con'),nl,write(A),write('Con la edad de:'),write(C),nl,fail.

parejag:-write('Cual es su nombre?'),read(Nombre),nl,write('Le es importante el signo zodiacal?'),read(Resps),signop(Nombre,Resps).

signop(Nombre,s):-write('Que signo le interesa?'),read(Signoab),nl,write('Que edad le interesa(Menor,Mayor o indistinto)?'),read(Edad),edads(Nombre,Signoab,Edad),fail.
signop(Nombre,n):-write('Que edad le interesa(Menor,Mayor o indistinto)?'),read(Edad),edad(Nombre,Edad),fail.


edads(Nombre,Signoab,menor):-persona(Nombre,A,B,_,_),persona(X,Y,Z,_,_),Z=<B,nl,write('�Que sexo busca?/hombre,mujer,indistinto'),read(Sexab),sexop(Nombre,Signoab,A,B,X,Y,Z,Sexab).
edads(Nombre,Signoab,mayor):-persona(Nombre,A,B,_,_),persona(X,Y,Z,_,_),Z>=B,write('�Que sexo busca?/hombre,mujer,indistinto'),read(Sexab),sexop(Nombre,Signoab,A,B,X,Y,Z,Sexab).
edads(Nombre,Signoab,indistinto):-persona(Nombre,A,B,_,_),persona(X,Y,Z,_,_),write('�Que sexo busca?/hombre,mujer,indistinto'),read(Sexab),sexop(Nombre,Signoab,A,B,X,Y,Z,Sexab).


edad(Nombre,mayor):-persona(Nombre,A,B,_,_),persona(X,Y,Z,_,_),B=<Z,nl,write('�Que sexo busca?/hombre,mujer,indistinto'),read(Sexab),sexop1(Nombre,A,B,X,Y,Z,Sexab).
edad(Nombre,menor):-persona(Nombre,A,B,_,_),persona(X,Y,Z,_,_),Z>=B,nl,write('�Que sexo busca?/hombre,mujer,indistinto'),read(Sexab),sexop1(Nombre,A,B,X,Y,Z,Sexab).
edad(Nombre,indistinto):-persona(Nombre,A,B,_,_),persona(X,Y,Z,_,_),nl,write('�Que sexo busca?/hombre,mujer,indistinto'),tab(5),read(Sexab),sexop1(Nombre,A,B,X,Y,Z,Sexab).


sexop(Nombre,Signoab,A,B,X,Y,Z,hombre):-Y=hombre,signo(Nombre,Sig),signo(X,Sig2),Signoab=Sig2,imprimir(Nombre,Sig2,A,B,X,Y,Z,Sig).

sexop(Nombre,Signoab,A,B,X,Y,Z,mujer):-Y=mujer,signo(Nombre,Sig),signo(X,Sig2),Signoab=Sig2,imprimir(Nombre,Sig2,A,B,X,Y,Z,Sig).



sexop(Nombre,Signoab,A,B,X,Y,Z,indistinto):-signo(Nombre,Sig),signo(X,Sig2),Signoab=Sig2,imprimir(Nombre,Sig2,A,B,X,Y,Z,Sig).



sexop1(Nombre,_,_,X,Y,Z,hombre):-Y=hombre,write('Su nombre es: '),tab(1),write(Nombre),nl,nl,write('Sus posibles parejas son: '),nl,write('Nombre:'),tab(3),write(X),nl,write('Sexo:'),tab(3),write(Y),nl,write('Edad:'),tab(2),write(Z).

sexop1(Nombre,_,_,X,Y,Z,mujer):-Y=mujer,write('Su nombre es: '),tab(1),write(Nombre),nl,nl,write('Sus posibles parejas son: '),nl,write('Nombre:'),tab(3),write(X),nl,write('Sexo:'),tab(3),write(Y),nl,write('Edad:'),tab(2),write(Z).

sexop1(Nombre,_,_,X,Y,Z,indistinto):-write('Su nombre es: '),tab(1),write(Nombre),nl,nl,write('Sus posibles parejas son: '),nl,write('Nombre:'),tab(3),write(X),nl,write('Sexo:'),tab(3),write(Y),nl,write('Edad:'),tab(2),write(Z).



imprimir(Nombre,Sig2,_,_,X,Y,_,_):-write('Estimado'),tab(2),write(Nombre),nl,write('Las posibles parejas con el signo:'),tab(2),write(Sig2),nl,write('Son:'),nl,write(X),tab(2),write('Sexo:'),write(Y),nl,write('Signo:'),write(Sig2).


