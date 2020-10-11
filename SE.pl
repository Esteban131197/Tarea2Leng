:-use_module(library(pce)).
:-use_module(library(pce_style_item)).


inicio:-
	new(Menu, dialog('RestauranTEC', size(1000,800))),
	new(L,label(nombre,'SISTEMA DE BUSQUEDA DE RESTAURANTES')),
	new(A,label(nombre,'')),
	new(@texto,label(nombre,'Realiza una conversacion con el SE')),
	new(@respl,label(nombre,'')),
	new(Salir,button('SALIR',and(message(Menu, destroy),message(Menu,free)))),
	new(@boton,button('Iniciar Conversacion',message(@prolog,botones))),


	send(Menu,append(L)),new(@btncarrera,button('Diagnostico?')),
	send(Menu,display,L,point(125,20)),
	send(Menu,display,A,point(80,360)),
	send(Menu,display,@boton,point(100,150)),
	send(Menu,display,@texto,point(20,100)),
	send(Menu,display,Salir,point(20,400)),
	send(Menu,display,@respl,point(20,130)),
	send(Menu,open_centered).

%enfermedad que precenta y tratamiento de acuerdo a las reglas de diagnostico

fallas('Nuestra sugerencia es:
	VillaItalia:
 Ubicado 200m al norte del Tecnologico de Cartago.
Recuerde: Que por disposiciones del Ministerio de Salud solo se permiten Burbujas.
'):-villaitalia,!.

fallas('Nuestra sugerencia es:
       PizzaHut:
 Ubicado en Cartago centro.
Recuerde: Que por disposiciones del Ministerio de Salud solo se permiten Burbujas.
,'):-pizzahut,!.

fallas('Nuestra sugerencia es:
Rostipollos:
 Ubicado 100m al norte de la basilica de los angeles.
Recuerde: Que por disposiciones del Ministerio de Salud solo se permiten Burbujas.
 '):-rostipollos,!.

fallas('Nuestra sugerencia es:
Capitan Alitas:
 Ubicado en camino a Volcan Irazu.
Tratamiento para detener el sangrado. Si la pérdida de sangre está causando
anemia por deficiencia de hierro, el tratamiento dependerá de la causa del sangrado.
Por ejemplo, si usted tiene una úlcera sangrante,
el médico puede recetarle antibióticos y otras medicinas para tratar la úlcera.
Recuerde: Que por disposiciones del Ministerio de Salud solo se permiten Burbujas.
'):-capitanalitas,!.

fallas('Nuestra sugerencia es:
POPS:
 Ubicado a un costado de iglesia los capuccinos.
Recuerde: Que por disposiciones del Ministerio de Salud solo se permiten Burbujas.
'):-pops,!.

fallas('Nuestra sugerencia es:
Gelato:
 Ubicado en Paseo Metropoli.
Recuerde: Que por disposiciones del Ministerio de Salud solo se permiten Burbujas.
'):-gelato,!.


fallas('sin resultados, usted no dio la informacion necesaria o suficiente
ERROR p560c4!').

% preguntas para dirigir a la enfermedad adecuada con su respectivo
% identificador de enfermedad

villaitalia:- svillaitalia,
	pregunta('En Cartago?'),
	pregunta('A la leña?'),
	pregunta('Para comer en el lugar?');
	pregunta('Sabores Italianos?').

pizzahut:- spizzahut,
        pregunta('En Cartago?'),
	pregunta('En menos de 15 minutos?'),
	pregunta('Para pedir express?');
	pregunta('Para comer en el lugar?').

rostipollos:- srostipollos,
	pregunta('Pollo a la leña?'),
        pregunta('En Cartago?');
	pregunta('Para comer en el lugar?');
	pregunta('Combos familiares?').

capitanalitas:- scapitanalitas,
	pregunta('alitas?'),
	pregunta('En En Paseo Metropoli?');
	pregunta('Para comer en el lugar?');
	pregunta('Para pedir express? ').

pops:- spops,
	pregunta('Helado de lactosa?'),
	pregunta('En Cartago centro?'),
	pregunta('En menos de 15 minutos?'),
	pregunta('Para pedir express?').

gelato:- sgelato,
	pregunta('Helado de yogurt?'),
	pregunta('En Paseo Metropoli?'),
	pregunta('Para comer en el lugar?').

%identificador de falla que dirige a las preguntas correspondientes

svillaitalia:-pregunta('Quieres comer pizza?'),!.
spizzahut:-pregunta('Quieres comer pizza?'),!.
srostipollos:-pregunta('Quieres comer pollo?'),!.
scapitanalitas:-pregunta('Quieres comer pollo?'),!.
spops:-pregunta('Quieres comer algun postre?'),!.
sgelato:-pregunta('Quieres comer algun postre?'),!.

% proceso del diagnostico basado en preguntas de si y no, cuando el
% usuario dice si, se pasa a la siguiente pregunta del mismo ramo, si
% dice que no se pasa a la pregunta del siguiente ramo


:-dynamic si/1,no/1.
preguntar(Problema):- new(Di,dialog('Conversacion')),
     new(L2,label(texto,'Responde las siguientes preguntas')),
     new(La,label(prob,Problema)),
     new(B1,button(si,and(message(Di,return,si)))),
     new(B2,button(no,and(message(Di,return,no)))),

         send(Di,append(L2)),
	 send(Di,append(La)),
	 send(Di,append(B1)),
	 send(Di,append(B2)),

	 send(Di,default_button,si),
	 send(Di,open_centered),get(Di,confirm,Answer),
	 write(Answer),send(Di,destroy),
	 ((Answer==si)->assert(si(Problema));
	 assert(no(Problema)),fail).

% cada vez que se conteste una pregunta la pantalla se limpia para
% volver a preguntar

pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

% proceso de eleccion de acuerdo al diagnostico basado en las preguntas
% anteriores

botones :- lim,
	send(@boton,free),
	send(@btncarrera,free),
	fallas(Falla),
	send(@texto,selection(' ')),
	send(@respl,selection(Falla)),
	new(@boton,button('inicia procedimiento mecanico',message(@prolog,botones))),
        send(Menu,display,@boton,point(40,50)),
        send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim :- send(@respl, selection('')).
