% Hechos directos
padre(tito, daniel).
padre(tito, enrique).
madre(paola, daniel).
madre(paola, enrique).

% Hermanos
hermano(daniel, enrique).
hermano(tito, antonio).

% Tíos
tio(antonio, daniel).
tio(antonio, enrique).
tia(flora, daniel).
tia(flora, enrique).

% Matrimonio
esposo(antonio, flora).
esposa(flora, antonio).

% Abuelos
padre(segundo, tito).
madre(carmen, tito).
abuelo(segundo, daniel).
abuelo(segundo, enrique).
abuela(carmen, daniel).
abuela(carmen, enrique).

% Primos
padre(antonio, milagros).
padre(antonio, juli).
madre(flora, milagros).
madre(flora, juli).
primo(milagros, daniel).
primo(milagros, enrique).
primo(juli, daniel).
primo(juli, enrique).

% Bisabuelos
padre(hector, segundo).
madre(karelia, segundo).
bisabuelo(hector, daniel).
bisabuelo(hector, enrique).
bisabuela(karelia, daniel).
bisabuela(karelia, enrique).

% Reglas para relaciones derivadas (se mantienen igual que antes)
hermano(X, Y) :- padre(P, X), padre(P, Y), madre(M, X), madre(M, Y), X \= Y.
abuelo(A, N) :- padre(A, P), padre(P, N).
abuelo(A, N) :- padre(A, P), madre(P, N).
tio(T, S) :- hermano(T, P), padre(P, S).
tio(T, S) :- hermano(T, M), madre(M, S).
tia(T, S) :- tio(T, S), mujer(T).
primo(X, Y) :- padre(PX, X), padre(PY, Y), hermano(PX, PY).
primo(X, Y) :- madre(MX, X), madre(MY, Y), hermano(MX, MY).
bisabuelo(B, N) :- abuelo(B, P), padre(P, N).
bisabuelo(B, N) :- abuelo(B, P), madre(P, N).

% Predicados para género
mujer(paola).
mujer(carmen).
mujer(flora).
mujer(milagros).
mujer(juli).
mujer(karelia).