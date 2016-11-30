productos(p1,refresco,30).
productos(p2,galletas,35).
productos(p3,cereal,40).
productos(p4,aceite,10).
productos(p5,chetos,8).

cliente(c1,antonio,oro).
cliente(c2,edgar,plata).
cliente(c3,jose,bronce).

descuento(oro,25).
descuento(plata,15).
descuento(bronce,8).

mostrarc:-cliente(_,C,_),write(C),nl,fail.
mostrarc2:-reite('Tpio de susuario'),read(Us),nl,cliente(_,C,Us),write(C),nl,fail.
calcular:-
