limpiar:-write('\033[2J').
pausa:-nl,write('Presione cualquier tecla para continuar...'),skip(10).
menu:-limpiar,write('1 Multiplicacion\n.2 Tablas\n.3 Salir\n Selecciona opcion'),read(Opc),menu(Opc).
menu(1):-multiplicacion.
menu(2):-tabla.
menu(3):-pausa.
menu(_):-write('\nOpcion invalida...\n'),menu.





tabla:-limpiar,write('Que tabla desea desplegar?(-250 a 250)'),read(Tbl),verificar(Tbl).

verificar(Tbl):-(Tbl >= -250),(Tbl =< 250),veri2(Tbl).
veri2(Tbl):-Tbl =\= 0,hola(Tbl,0).
hola(Tbl,Inicio):-Inicio2 is Inicio+1,Inicio2=<10,write(Tbl),tab(1),write('*'),tab(1),write(Inicio2),M is Tbl*Inicio2,write('='),tab(1),write(M),nl,hola(Tbl,Inicio2).
hola(_,Inicio2):-pausa,menu.





multiplicacion:-limpiar,write('Ingrese primer numero'),read(Num1),write('Ingrese el segundo numero'),read(Num2),operacion(Num1,Num2,0),pausa.

operacion(Num1,Num2,0):-(Num1=0;Num2=0),write('No se puede realizar la operacion'),pausa,menu.
operacion(Num1,Num2,Acumulador):-Num2>=2,IN2 is Num2-1,write(Num1),write('+'),Res is Acumulador + Num1,operacion(Num1,IN2,Res).
operacion(Num1,_,Acumulador):-write(Num1),write('='),Res is Acumulador +Num1,write(Res),preg.
preg:-nl,nl,nl,write('Desea realizar otra operacion?'),read(Opc),preg(Opc),pausa.
preg(s):-multiplicacion.
preg(n):-menu.
preg(_):-preg.




