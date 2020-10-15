%Lista de enfermedades, las enfermedades se tratan como strings

restaurante("BellaItalia").%gripe
restaurante("Rostipollos").%virus est
restaurante("McBurguesa").%cancer
restaurante("Italianisimo").%broq

% Lista de sintomas, de momento los sintomas son tratados como atomos de
% prolog, sin embargo hay algunos que pueden quedar ambig�os como dolor
% (puede ser dolor de cuerpo, dolor de est�mago,etc), igual sucede con
% p�rdida (p�rdida de apetito, p�rdida de peso).Se puede cambiar a
% string para solucionar la ambig�edad pero se debe recibir el string
% completo de la comunicaci�n con el usuario

clave(pizza).%tos
clave(pasta).%fiebre
clave(cansancio).%
clave(pollo).%diarrea
clave(alitas).%vomito
clave(cocacola).%dolor
clave(perdida).%perdida
clave(flema).
clave(picazon).
clave(ampollas).
clave(muerte).
clave(polvo).
clave(inexistencia).

% Lista de Causas para cada enfermedad, El primer string del hecho es la
% causa (la cu�l es propia y �nica para cada enfermedad), el segundo
% string indica a cu�l enfermedad pertenece dicha causa.

direccion("BellaItalia"," el cual esta ubicado a 300 metros sur de la entrada principal de la Universidad de Costa Rica").
direccion("Rostipollos","de la munipalidad de Cartago 225 metros al este, local esquinero").
direccion("Italianisimo"," se ubica a 50 metros sur de la entrada del Banco de Costa Rica").
direccion("McBurguesa","se encuentra a 100 metros norte de la entrada principal del TEC").

% Hechos que me indican si una enfermedad tiene tratamiento previo, para
% incluirlos tambi�n en la lista de prevenciones de cada enfermedad. El
% primer string es el nombre de la enfermedad y el segundo el
% tratamiento.

reservacion("BellaItalia","Su espacio es hoy a las 8:00pm").
reservacion("Rostipollos","Lamentablemente no hay espacios disponibles").
reservacion("Italianisimo","Las reservaciones solo se permiten con dos dias de anticipacion").
reservacion("McBurguesa","No necesita reservacion para ingresar al local").

% Hechos que me indican las �reas de afectaci�n de cada enfermedad, una
% misma enfermedad puede atacar diferentes �reas del cuerpo

res_area("BellaItalia",respiracion).
res_area("BellaItalia",cuerpo).
res_area("BellaItalia",temperatura).
res_area("Rostipollos",estomago).
res_area("Rostipollos",temperatura).
res_area("McBurguesa",cuerpo).
res_area("McBurguesa",peso).
res_area("McBurguesa",temperatura).
res_area("McBurguesa",condicion_fisica).
res_area("Italianisimo",respiracion).
res_area("Italianisimo",cuerpo).
res_area("Italianisimo",pecho).
res_area("Tukasa",piel).
res_area("Tukasa",temperatura).
res_area("Subway",cabeza).
res_area("Subway",torso).
res_area("Subway",piernas).

% �reas de afectaci�n de cada s�ntoma, en principio un sintoma solo
% puede atacar un �rea espec�fica del cuerpo, sin embargo hay algunos
% sintomas que atacan varias �reas debido a la ambig�edad de los mismos
% (son el caso de dolor y perdida).

clave_area(pizza,respiracion).
clave_area(pasta,temperatura).
clave_area(cansancio,cuerpo).
clave_area(pollo,estomago).
clave_area(alitas,estomago).
clave_area(cocacola,estomago).
clave_area(cocacola,cuerpo).
clave_area(perdida,peso).
clave_area(perdida,estomago).
clave_area(flema,pecho).
clave_area(picazon,piel).
clave_area(ampollas,piel).
clave_area(muerte, cabeza).
clave_area(polvo, torso).
clave_area(inexistencia, piernas).

% ------------------------------------------------------------------------
% Palabras para el BNF

nombre([mcdonals|A],A).
nombre([pasta|A],A).
nombre([cansancio|A],A).
nombre([pizza|A],A).
nombre([pollo|A],A).
nombre([cocacola|A],A).
nombre([alitas|A],A).
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
nombre([cura|A],A).

nombre([pizza|A],A).
nombre([pasta|A],A).
nombre([reserva|A],A).

verbo([crear|A],A).
verbo([reservar|A],A).

% -----------------------------------------------------------------------------
% Palabras clave de usuario

reser(reservacion).

direc(direccion).










