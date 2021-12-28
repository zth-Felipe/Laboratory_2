%----------------------TDAs--------------------.


%-------------- TDA Fecha ---------------
% Se crea una fecha estimada para cierto caso necesario.
% Formato: DD,MM,YYYY
% Entrada: number X number X number X OUT fecha
% Salida: TDA fecha

% Predicado TDA fecha
fecha(Dia,Mes,Anno,[Dia,Mes,Anno]):-
    number(Dia),number(Mes),number(Anno),
	Dia>=1, Dia=<31, Mes>=1, Mes=<12, Anno>0.


% sin verificaciones
%fecha(Dia,Mes,Anno,[Dia,Mes,Anno]).

% Como constructor
% fecha(21, 6, 2021, F).
% fecha(32, 2, 2021, F).

% Como pertenencia
% fecha(_, _, _, [21, 6, 2021]).
% fecha(_, _, _, "Hola mundo!").

% Como selector
% fecha(Y, _, _, [21, 6, 2021]).
% fecha(_, M, D, [21, 6, 2021]).

% F1 = [21, 6, 2020],
% F2 = [21, 6, 1990]


%------------ TDA Usuario -------------
% Componentes que tiene cada usuario.
% Formato: nombre, contraseña, documentos compartidos
% Entrada: number X string X string X list X OUT usuario
% Salida: TDA usuario

% Predicado TDA usuario
usuario(IDuser, Nombre, Contrasena, Docs,[IDuser, Nombre, Contrasena, Docs]):-
	number(IDuser), string(Nombre), string(Contrasena).

% Sin verificaciones
% usuario(IDuser, Nombre,Contrasena,IDDoc,[Nombre, Contrasena, IDDoc]).

% Como constructor
% usuario(1, "Felipe", "casas123", [1, 2, 3], U1).
% usuario(2, "Dante", "gato777", [], U2).

% Como pertenencia
% usuario(_,_,_,["Felipe","casas123",(1,2,3)]).
% usuario(_,_,_,"tres tigres").

% Como selector
% usuario(_,N,_,_,["Felipe","casas123",[1,2,3]]).
% usuario(_,_,C,D,["Felipe","casas123",[1,2,3]]).

%----------- TDA documento ---------------
% Componentes que tiene cada documento
% Formato: 
% Entrada:
% Salida:

% Predicado TDA documento
documento(IDdoc, NombreDoc, Contenido, FechaDoc, [IDdoc, NombreDoc, Contenido, FechaDoc, []]):-
    number(IDdoc), string(NombreDoc), string(Contenido).

% Sin verificaciones
% documento(IDdoc, NombreDoc, Contenido, FechaDoc, [IDdoc, NombreDoc, Contenido, FechaDoc]).

% Como constructor
% documento(1, "Doc1", "primer documento", FechaDoc, DOC1).
% documento(2, "Doc2", "segundo documento", FechaDoc, DOC2).

% Como pertenencia
% documento(_, _, _, _, [1, "Doc1", "primer documento", FechaDoc]).
% documento(_, _, _, _, [2, "Doc2", "segundo documento", FechaDoc]).

% Como selector
% documento(_, ND, _, _, [IDdoc, NombreDoc, Contenido, FechaDoc]).
% documento(IdDoc, _, Cont, _, [IDdoc, NombreDoc, Contenido, FechaDoc]).

%----------- TDA paradigmadoc ---------------
% 
% 
% 
% 

% Predicado TDA paradigmadoc
paradigmadoc(NombreParadoc, FechaParadoc, [


