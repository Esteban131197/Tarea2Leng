%Lista de enfermedades, las enfermedades se tratan como strings

restaurante("PizzaHut").%gripe
restaurante("Rostipollos").%virus est
restaurante("Mcdonalds").%cancer
restaurante("TacoBell").%broq
restaurante("Tukasa").%varic
restaurante("Subway").%thanos

% Lista de sintomas, de momento los sintomas son tratados como atomos de
% prolog, sin embargo hay algunos que pueden quedar ambig�os como dolor
% (puede ser dolor de cuerpo, dolor de est�mago,etc), igual sucede con
% p�rdida (p�rdida de apetito, p�rdida de peso).Se puede cambiar a
% string para solucionar la ambig�edad pero se debe recibir el string
% completo de la comunicaci�n con el usuario

clave(tos).
clave(fiebre).
clave(cansancio).
clave(diarrea).
clave(vomito).
clave(dolor).
clave(perdida).
clave(flema).
clave(picazon).
clave(ampollas).
clave(muerte).
clave(polvo).
clave(inexistencia).


% Lista de Causas para cada enfermedad, El primer string del hecho es la
% causa (la cu�l es propia y �nica para cada enfermedad), el segundo
% string indica a cu�l enfermedad pertenece dicha causa.


causa("La gripe es causada por el virus de la influenza","PizzaHut").
causa("El virus que causa la varicela es el virus varicela z�ster","Tukasa").
causa("El virus estomacal es causado por el norovirus y el rotavirus ","Rostipollos").
causa("Los mismos virus que causan los resfriados y la gripe son la causa m�s frecuente de la bronquitis","TacoBell").
causa("Por lo general el cancer lo provocan mutaciones geneticas","Mcdonals").
causa("gemas","Subway").



%Lista de prevenciones

prevencion("Lavarse las manos").
prevencion("Cubrise la boca al toser").
prevencion("Usar desinfectante para manos").
prevencion("Desinfectar superficies y objetos del hogar").
prevencion("Hacer ejercicio con frecuencia").
prevencion("Tener buena alimentaci�n").
prevencion("Evitar los vicios como alcohol o cigarros").
prevencion("ninguna").
prevencion("matar a thanos").
prevencion("no existir").


% Hechos que me asocian una prevenci�n, con el �rea del cuerpo a la
% cu�l va dirigida la prevenci�n

prevencion_area("Lavarse las manos",estomago).
prevencion_area("Lavarse las manos",respiracion).
prevencion_area("Cubrise la boca al toser",respiracion).
prevencion_area("Usar desinfectante para manos",estomago).
prevencion_area("Desinfectar superficies y objetos del hogar",estomago).
prevencion_area("Hacer ejercicio con frecuencia",condicion_fisica).
prevencion_area("Tener buena alimentaci�n",peso).
prevencion_area("Evitar los vicios como alcohol o cigarros",condicion_fisica).
prevencion_area("ninguna",muerte).
prevencion_area("matar a thanos",polvo).
prevencion_area("no existir",inexistencia).

% Hechos que me indican si una enfermedad tiene tratamiento previo, para
% incluirlos tambi�n en la lista de prevenciones de cada enfermedad. El
% primer string es el nombre de la enfermedad y el segundo el
% tratamiento.

tratamiento_previo("PizzaHut","Vacunarse todos los a�os").
tratamiento_previo("TacoBell","Ponerse la vacuna para la gripe todos los a�os").
tratamiento_previo("Tukasa","Vacunarse contra el virus que produce la varicela").
tratamiento_previo("Subway","matar a thanos").


% Lista de tratamientos posteriores a la enfermedad, el hecho los asocia
% directamente con la enfermedad (segundo par�metro) ya que los
% tratamientos son �nicos para cada tipo de enfermedad de la base de
% datos


tratamiento_enfermedad("Tomar antigripal por una semana y tomar l�quidos en abundancia","PizzaHut").
tratamiento_enfermedad("Ingerir alimentos blandos y mantenerse hidratado","Rostipollos").
tratamiento_enfermedad("Consumir medicamentos para la tos y comprar un inhibidor para los pulmones","TacoBell").
tratamiento_enfermedad("Cubrir las ampollas para la piel y utilizar cremas para reducir la picaz�n","Tukasa").
tratamiento_enfermedad("Someterse a una quimioterapia","Mcdonals").
tratamiento_enfermedad("ninguno","Subway").



% Hechos que me indican las �reas de afectaci�n de cada enfermedad, una
% misma enfermedad puede atacar diferentes �reas del cuerpo

enfermedad_area("PizzaHut",respiracion).
enfermedad_area("PizzaHut",cuerpo).
enfermedad_area("PizzaHut",temperatura).
enfermedad_area("Rostipollos",estomago).
enfermedad_area("Rostipollos",temperatura).
enfermedad_area("Mcdonals",cuerpo).
enfermedad_area("Mcdonals",peso).
enfermedad_area("Mcdonals",temperatura).
enfermedad_area("Mcdonals",condicion_fisica).
enfermedad_area("TacoBell",respiracion).
enfermedad_area("Tacobell",cuerpo).
enfermedad_area("Tacobell",pecho).
enfermedad_area("Tukasa",piel).
enfermedad_area("Tukasa",temperatura).
enfermedad_area("Subway",cabeza).
enfermedad_area("Subway",torso).
enfermedad_area("Subway",piernas).


% �reas de afectaci�n de cada s�ntoma, en principio un sintoma solo
% puede atacar un �rea espec�fica del cuerpo, sin embargo hay algunos
% sintomas que atacan varias �reas debido a la ambig�edad de los mismos
% (son el caso de dolor y perdida).

sintoma_area(tos,respiracion).
sintoma_area(fiebre,temperatura).
sintoma_area(cansancio,cuerpo).
sintoma_area(diarrea,estomago).
sintoma_area(vomito,estomago).
sintoma_area(dolor,estomago).
sintoma_area(dolor,cuerpo).
sintoma_area(perdida,peso).
sintoma_area(perdida,estomago).
sintoma_area(flema,pecho).
sintoma_area(picazon,piel).
sintoma_area(ampollas,piel).
sintoma_area(muerte, cabeza).
sintoma_area(polvo, torso).
sintoma_area(inexistencia, piernas).

% ------------------------------------------------------------------------
% Palabras para el BNF
nombre([hombre|A],A).
nombre([cancer|A],A).
nombre([yo|A],A).
nombre([doctor|A],A).
nombre([drlog|A],A).%%%OJO CON ESTA LINEA
nombre([fiebre|A],A).
nombre([cansancio|A],A).
nombre([tos|A],A).
nombre([diarrea|A],A).
nombre([dolor|A],A).
nombre([vomito|A],A).
nombre([flema|A],A).
nombre([perdida|A],A).
nombre([ampollas|A],A).
nombre([garganta|A],A).
nombre([cabeza|A],A).
nombre([espalda|A],A).
nombre([estomago|A],A).
nombre([virus|A],A).
nombre([manos|A],A).
nombre([ojos|A],A).
nombre([nariz|A],A).
nombre([bronquitis|A],A).
nombre([varicela|A],A).
nombre([enfermedad|A],A).
nombre([tratamiento|A],A).
nombre([prevencion|A],A).
nombre([cura|A],A).

nombre([tos|A],A).
nombre([fiebre|A],A).
nombre([cansancio|A],A).
nombre([enfermedad|A],A).

verbo([tiene|A],A).
verbo([tengo|A],A).
verbo([duele|A],A).
verbo([curar|A],A).
verbo([tratar|A],A).
verbo([prevenir|A],A).


determinante([el|A],A).
determinante([como|A],A).
determinante([que|A],A).
determinante([cual|A],A).
determinante([en|A],A).
determinante([esa|A],A).
determinante([lo|A],A).
determinante([cuando|A],A).
determinante([con|A],A).
determinante([la|A],A).
% -----------------------------------------------------------------------------
% Palabras clave de usuario
saludo(hola).
saludo(saludos).
saludo(buenas).
saludo(buenos).

despedida(adios).
despedida(luego).

prev(prevenirla).
prev(prevenirlo).
prev(prevenir).
prev(prevencion).

trat(tratamiento).
trat(tratarlo).
trat(tratarla).
trat(tratar).
trat(curarme).
trat(cura).
trat(tomar).
trat(medicina).

caus(causa).
caus(provoca).










