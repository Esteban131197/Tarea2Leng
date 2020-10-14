:-consult('DataBase').

restauranTEC():- %se inicializan las variables de sintomas y enfermedad del paciente en 0.
    write("Hola.\n"),
    b_setval(clave1,0),
    b_setval(clave2,0),
    b_setval(clave3,0),
    b_setval(comida,0),
    conversacion().

restauranTEC(X,Y):-
    b_setval(clave1,0),
    b_setval(clave2,0),
    b_setval(clave3,0),
    b_setval(comida,0),
    nb_setval(restaurante, 0),
    conversacion(X,Y).



conversacion(X,Salida):-atomic_list_concat(List," ",X),
    revisar(List,Salida).

conversacion():-read(X),
    atomic_list_concat(List," ",X),
    revisar(List),
    conversacion(). %recursividad para hacer un ciclo de conversacion





revisar(List):- searchExtra(List). %keywords sin necesidad de revisar sintaxis
revisar(List):- %oracion(List,[]), %keywords que importa la sintaxis
  searchKeywords(List).

revisar(_):- write("Lo siento, no entendi, por favor repitalo.\n").

revisar(List,Y):- searchExtra(List,Y),!. %keywords sin necesidad de revisar sintaxis
revisar(List,Y):- searchKeywords(List,Y).
%keywords que importa la sintaxis

revisar(List,Y):- (not(oracion(List,[]))),atom_concat('Lo siento, no entendi, por favor repitalo.\n','',Y).


% -------------------------------------------------------------------------
% Asigna un sintoma nuevo a las variables nulas.
asignarVar(Clave):- b_getval(clave1,C1), C1 == 0, b_setval(clave1, Clave).
asignarVar(Clave):- b_getval(clave2,C2), C2 == 0, b_setval(clave2, Clave).
asignarVar(Clave):- b_getval(clave3,C3), C3 == 0, b_setval(clave3, Clave).

suficientesClaves():-b_getval(clave1,C1),b_getval(clave2,C2),b_getval(clave3,C3),
    claves_de(C1,C2,C3,R), b_setval(comida,R),nb_setval(restaurante, R),

    write("Lamento decirle esto, pero usted padece de "),write(R),nl.
suficientesClaves().

suficientesClaves(_):-b_getval(clave1,C1),b_getval(clave2,C2),b_getval(clave3,C3),
claves_de(C1,C2,C3,R), b_setval(comida,R),nb_setval(restaurante, R).
suficientesClaves(_).

% revisa las keywords y da una respuesta dependiendo del tipo de keyword
keyword(Word,Resto):- sintoma(Word),%el paciente est� dando mencionando un sintoma
     asignarVar(Word), suficientesClaves(),searchKeywords(Resto).

keyword(Word,_):- caus(Word), %pregunta por las causas de su enfermedad
    b_getval(comida,R),
    (   R \= 0 -> causa_enfermedad(R,C), write(C), nl;
        write("Como quiere que le de la causa de su enfermedad si aun no me ha dicho los sintomas necesarios para darle un diagnostico?"), nl).

keyword(Word,_):- trat(Word), %pregunta por el tratamiento de su enfermedad
    b_getval(comida,R),
    (   R \= 0 -> curar_enfermedad(R,T),write("Usted debe "), write(T), nl;
        write("Como quiere que le diga como curar de su enfermedad si aun no me ha dicho los sintomas necesarios para darle un diagnostico?"), nl).

keyword(Word,_):- prev(Word), %pregunta como prevenir la enfermedad
    b_getval(comida,R),
    (   R \= 0 -> write("Para prevenir esa enfermedad, se recomienda "),nl,
        lista_prevenciones(R);
        write("Como quiere que le diga como prevenir de su enfermedad si aun no me ha dicho los sintomas necesarios para darle un diagnostico?"), nl).

%GUI
keyword(Word,Resto,_):- sintoma(Word),%el paciente est� dando mencionando un sintoma
asignarVar(Word), suficientesClaves(_),searchKeywords(Resto).

keyword(Word,_,Salida):- caus(Word), %pregunta por las causas de su enfermedad
   b_getval(comida,R),
   (   R \= 0 -> causa_enfermedad(R,C),atom_concat('La causa comun de esa enfermedad es ', C, Salida);
        atom_concat('Como quiere que le de la causa de su enfermedad si aun no me ha dicho los sintomas necesarios para darle un diagnostico?\n','',Salida)).

keyword(Word,_,Salida):- trat(Word), %pregunta por el tratamiento de su enfermedad
   b_getval(comida,R),
   (   R \= 0 -> curar_enfermedad(R,T),atom_concat('"Usted debe ', T, Salida);
        atom_concat('Como quiere que le diga como curar de su enfermedad si aun no me ha dicho los sintomas necesarios para darle un diagnostico?','',Salida)).
keyword(Word,_, Salida):- prev(Word), %pregunta como prevenir la enfermedad
   b_getval(comida,R),
   (   R \= 0 -> lista_prevenciones(R),atom_concat('Para prevenir esa enfermedad, se recomienda','',Salida);
       atom_concat('Como quiere que le diga como prevenir de su enfermedad si aun no me ha dicho los sintomas necesarios para darle un diagnostico?','',Salida)).


keywordExtra(Word):- saludo(Word), write("Hola, en que lo puedo ayudar hoy?"), nl.
keywordExtra(Word):- despedida(Word), write("Adios, espero que est� bien."), nl,
    break.

keywordExtra(Word,Salida):- saludo(Word), atom_concat('Hola, en que lo puedo ayudar hoy?','',Salida).
keywordExtra(Word,Salida):- despedida(Word), atom_concat('Adios, espero que est� bien','',Salida),
    break.

%busqueda en la lista de palabras
searchKeywords([]).
searchKeywords([X|Z]):- keyword(X,Z); searchKeywords(Z).

searchKeywords([X|Z],Salida):- keyword(X,Z,Salida).
searchKeywords([_|Z],Salida):-searchKeywords(Z,Salida).
searchKeywords([],Salida):- Salida \= 0 ,nb_getval(enfermedad, Salida).

searchExtra([]):-false.
searchExtra([X|Z]):- keywordExtra(X); searchExtra(Z).

searchExtra([], _ ):-false.
searchExtra([X|Z],Salida):- keywordExtra(X,Salida); searchExtra(Z,Salida).
% ------------------------------------------------------------------------------
% BNF
oracion(A,B):- sintagma_nominal(A,C),
               sintagma_verbal(C,B).

sintagma_nominal(A,B):- nombre(A,B).
sintagma_nominal(A,B):- determinante(A,C),
                        nombre(C,B).

sintagma_verbal(A,B):- verbo(A,C),
                       sintagma_nominal(C,B).
sintagma_verbal(A,B):- verbo(A,B).

% ------------------------------------------------------------------------


% Reglas principales para relacionar los hechos de la base de datos y
% enviar la informacin correspondiente al usuario

% Regla que me relaciona un solo sintoma con una enfermedad, la variable
% S se refiere a sintoma y la variable E se refiere a enfermedad, la
% regla primero verifica que efectivamente se traten de sintomas y
% enfermedades de la base de datos, y luego hace la relaci�n verificando
% que el rea de afectacin del sintoma concuerde con una de las �reas
% de afectacin de la enfermedad

sintoma_de(S,R):-sintoma(S),restaurante(R),sintoma_area(S,Y),enfermedad_area(R,Y).


% Regla que me relaciona tres sintomas con una enfermedad, los tres
% sintomas son ingresados de la comunicaci�n con el usuario y en la
% variable E se almacena la enfermedad correspondiente

claves_de(C1,C2,C3,R):-sintoma_de(C1,R),sintoma_de(C2,R),sintoma_de(C3,R).


% Regla para relacionar una enfermedad con una causa, la enfermedad se
% recibe como par�metro y la regla instancia en la variable C la causa
% correspondiente

causa_enfermedad(R,C):-restaurante(R),causa(C,R).

% Reglas para obtener las formas de prevenci�n de una enfermedad, la
% regla de prevenir_enfermedad liga una enfermedad con una forma de
% prevenci�n (si existe tratamiento previo tambi�n se incluye) de
% acuerdo con el �rea de afectaci�n. La regla lista_prevenciones recibe
% una enfermedad como par�metro de entrada e instancia en la variable L
% la lista con todas las posibles prevenciones para dicha enfermedad.

prevenir_enfermedad(R,P):-restaurante(R),tratamiento_previo(R,P).
prevenir_enfermedad(R,P):-restaurante(R),prevencion(P),enfermedad_area(R,X),prevencion_area(P,X).

lista_prevenciones(R):-findall(Prevencion,prevenir_enfermedad(R,Prevencion),L),
    concatenarLista(L).

concatenarLista(L):- concatenarLista(L," ",_).
concatenarLista([],_,SF):-write(SF).
concatenarLista([C1|Resto],SI,_):- string_concat(C1,", ",S),
    string_concat(SI,S,SFinal),
    concatenarLista(Resto,SFinal,SFinal).


% Regla para relacionar el tratamiento con una enfermedad, se recibe
% como par�metro la enfermedad y devuelve en la variable T, el
% tratamiento respectivo para dicha enfermedad.

curar_enfermedad(R,T):-restaurante(R),tratamiento_enfermedad(T,R).

%base de datos







