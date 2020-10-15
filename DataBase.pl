%Lista de enfermedades, las enfermedades se tratan como strings

restaurante("BellaItalia").%gripe
restaurante("Rostipollos").%virus est
restaurante("McBurguesa").
restaurante("Italianisimo").

% Lista de sintomas, de momento los sintomas son tratados como atomos de
% prolog, sin embargo hay algunos que pueden quedar ambig�os como dolor
% (puede ser dolor de cuerpo, dolor de est�mago,etc), igual sucede con
% p�rdida (p�rdida de apetito, p�rdida de peso).Se puede cambiar a
% string para solucionar la ambig�edad pero se debe recibir el string
% completo de la comunicaci�n con el usuario

clave(pizza).%tos
clave(pasta).%fiebre
clave(pollo).%diarrea
clave(alitas).%vomito
clave(cocacola).%dolor
clave(papas).%perdida
clave(hamburguesa).
clave(tefrio).


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

res_area("BellaItalia",italiano).
res_area("BellaItalia",italiano2).
res_area("BellaItalia",bebida).
res_area("BellaItalia",bebida2).
res_area("Rostipollos",bebida).
res_area("Rostipollos",fritura1).
res_area("Rostipollos",fritura2).
res_area("McBurguesa",bebida2).
res_area("McBurguesa",hambur).
%res_area("McBurguesa",bebida).
res_area("McBurguesa",fritura3).
res_area("Italianisimo",italiano2).
res_area("Italianisimo",bebida2).
res_area("Italianisimo",bebida).

% �reas de afectaci�n de cada s�ntoma, en principio un sintoma solo
% puede atacar un �rea espec�fica del cuerpo, sin embargo hay algunos
% sintomas que atacan varias �reas debido a la ambig�edad de los mismos
% (son el caso de dolor y perdida).

clave_area(pizza,italiano).
clave_area(pasta,italiano2).
clave_area(hamburguesa,hambur).
clave_area(pollo,fritura1).
clave_area(alitas,fritura2).
clave_area(cocacola,bebida).
clave_area(tefrio,bebida2).
clave_area(papas,fritura3).

% ------------------------------------------------------------------------
% Palabras para el BNF

nombre([mcburguesa|A],A).
nombre([pasta|A],A).
nombre([hamburguesa|A],A).
nombre([pizza|A],A).
nombre([pollo|A],A).
nombre([cocacola|A],A).
nombre([alitas|A],A).
nombre([papas|A],A).
nombre([tefrio|A],A).


nombre([pizza|A],A).
nombre([pasta|A],A).
nombre([reserva|A],A).

verbo([crear|A],A).
verbo([reservar|A],A).

% -----------------------------------------------------------------------------
% Palabras clave de usuario

reser(reservacion).

direc(direccion).










