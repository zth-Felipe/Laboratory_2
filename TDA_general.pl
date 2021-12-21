%----------------------TDAs--------------------.

%-------------- TDA Fecha ---------------
% Se crea una fecha estimada para cierto caso necesario.
% Formato: DD,MM,YYYY

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

% Predicado TDA usuario
usuario(Nombre,Contrasena,IDDoc,[Nombre, Contrasena, IDDoc]):-
	string(Nombre), string(Contrasena).

% Sin verificaciones
%usuario(Nombre,Contrasena,IDDoc,[Nombre, Contrasena, IDDoc]).

% Como constructor
%usuario("Felipe", "casas123", (1, 2, 3), U1).
%usuario("Dante", "gato777", (1, 2, 3), U2).

% Como pertenencia
% usuario(_,_,_,[Felipe,casas123,(1,2,3)]).
% usuario(_,_,_,"tres tigres").

% 

%----------- TDA acceso ---------------
%

%documento(

