%Lista de restaurantes, los restaurantes se tratan como strings

restaurante("BellaItalia").
restaurante("Rostipollos").
restaurante("McBurguesa").
restaurante("Italianisimo").

% Lista de comidas, de momento las comidas son tratadas como atomos de
% prolog

clave(pizza).
clave(pasta).
clave(pollo).
clave(alitas).
clave(cocacola).
clave(papas).
clave(hamburguesa).
clave(tefrio).


% Lista de direcciones para cada restaurante, El primer string es el
% restaurante, el segundo string indica a cual restaurante pertenece
% dicha direccion.

direccion("BellaItalia"," el cual esta ubicado a 300 metros sur de la entrada principal de la Universidad de Costa Rica").
direccion("Rostipollos","de la munipalidad de Cartago 225 metros al este, local esquinero").
direccion("Italianisimo"," se ubica a 50 metros sur de la entrada del Banco de Costa Rica").
direccion("McBurguesa","se encuentra a 100 metros norte de la entrada principal del TEC").

% Hechos que me indican la reservacion del restaurante.

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

% clasificacion de cada alimento.

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




%fin





