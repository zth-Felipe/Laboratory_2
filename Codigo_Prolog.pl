%----------------------		TDAs	 --------------------.

% ---- TDA Fecha
% Formato: DD-MM-AAAA
% Predicado TDA fecha
fecha(Dia,Mes,Anno,[Dia,Mes,Anno]):-
    Dia>=1, Dia=<31, Mes>=1, Mes=<12, Anno>0.

% Como constructor
% fecha(21, 6, 2021, F).
% fecha(32, 2, 2021, F).

% Como pertenencia
% fecha(_, _, _, [21, 6, 2021]).
% fecha(_, _, _, "Hola mundo!").

% Como selector
% fecha(Y, _, _, [21, 6, 2021]).
% fecha(_, M, D, [21, 6, 2021]).
% ----


% ---- TDA Usuario
% Formato: id usuario - nombre usuario - contraseña usuario - documentos del usuario.
% Predicado TDA usuario
usuario(IDuser, Nombre, Contrasena, Docs,[IDuser, Nombre, Contrasena, Docs]):-
    integer(IDuser), string(Nombre), string(Contrasena).

% Sin verificaciones
% usuario(IDuser, Nombre,Contrasena,IDDoc,[IDuser,Nombre, Contrasena, IDDoc]).

% Como constructor
% usuario(1, "Felipe", "casas123", [1, 2, 3], U1).
% usuario(2, "Dante", "gato777", [], U2).

% Como pertenencia
% usuario(_,_,_,_,[1,"Felipe","casas123",(1,2,3)]).
% usuario(_,_,_,_,"tres tigres").

% Como selector[Cabeza|Resto]
getIDUser([Id|_],Id).							% Conseguir Id del usuario.
getNombreUser([_,Nombre|_],Nombre).				% Conseguir Nombre del usuario.
getContraUser([_,_,Contrasena|_],Contrasena).	% Conseguir Contraseña del usuario.
getDocsUser([_,_,_,Docs|_],Docs).				% Conseguir documentos del usuario.

% Como modificador
reemplazar( _, _, [], []).
reemplazar( Antiguo, Reemplazo , [Antiguo|Resto], [Reemplazo|NuevoResto] ):- 
    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).
reemplazar( Antiguo, Reemplazo, [Cabeza|Resto],[Cabeza|NuevoResto] ):- 
    Cabeza \= Antiguo, 
    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).
% ----


% ---- TDA documento
% Formato: id documento - nombre documento - contenido documento - fecha documento - usuarios permitidos 
% Predicado TDA documento
%documento(IDdoc, NombreDoc, Contenido, FechaDoc, [IDdoc, NombreDoc, Contenido, FechaDoc, []]):-
%    integer(IDdoc), string(NombreDoc), string(Contenido).

% Sin verificaciones
documento(IDdoc, NombreDoc, Contenido, FechaDoc, [IDdoc, NombreDoc, Contenido, FechaDoc, []]).

% Como constructor
% documento(1, "Doc1", "primer documento", FechaDoc, DOC1).
% documento(2, "Doc2", "segundo documento", FechaDoc, DOC2).

% Como pertenencia
% documento(_, _, _, _, [1, "Doc1", "primer documento", FechaDoc]).
% documento(_, _, _, _, [2, "Doc2", "segundo documento", FechaDoc]).

% Como selector
getIdDoc([Id|_],Id).
getNameDoc([_,Name|_],Name).
getContenidoDoc([_,_,Conten|_],Conten).
getFechaDoc([_,_,_,Fecha|_],Fecha).
getUsuariosId([_,_,_,_,Lista|_],Lista).

% Como modificador
%reemplazar( _, _, [], []).
%reemplazar( Antiguo, Reemplazo , [Antiguo|Resto], [Reemplazo|NuevoResto] ):- 
%    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).
%reemplazar( Antiguo, Reemplazo, [Cabeza|Resto],[Cabeza|NuevoResto] ):- 
%    Cabeza \= Antiguo, 
%    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).


% ---- TDA paradigmadoc
% Formato: nombre paradigmadoc - fecha de paradigmadoc - lista de usuarios - lista de documentos - historial paradigmadoc.
% Predicado TDA paradigmadoc
paradigmadoc(NombreParadoc, FechaParadoc, [NombreParadoc, FechaParadoc, [], [], [], 0]).

% Como constructor
% paradigmadoc("paradigmadoc1", Fecha1, PARADOC1).
% paradigmadoc("paradigmadoc2", Fecha2, PARADOC2).

% Como pertenencia
% paradigmadoc(_, _,["Doc1", Fecha1, [],[],[]]).
% paradigmadoc(_, _,["Doc2", Fecha2, [],[],[]]).

% Como selector
getNombreParaDoc([Nombre|_],Nombre).
getFechaParaDoc([_,Fecha|_],Fecha).
getListaUsuParaDoc([_,_,ListU|_],ListU).
getListaDocParaDoc([_,_,_,ListD|_],ListD).
getListaHistorialParaDoc([_,_,_,_,ListH|_],ListH).
getIdParaDoc([_,_,_,_,_,Id|_],Id).

% Como modificador
%reemplazar( _, _, [], []).
%reemplazar( Antiguo, Reemplazo , [Antiguo|Resto], [Reemplazo|NuevoResto] ):- 
%    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).
%reemplazar( Antiguo, Reemplazo, [Cabeza|Resto],[Cabeza|NuevoResto] ):- 
%    Cabeza \= Antiguo, 
%    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).

% --- MAIN --------------------------------------------------
paradigmaDocsRegister(Sn1, Fecha, Username, Password, Sn2):-
%    getNombreParaDoc(Sn1,Name),
    getFechaParaDoc(Sn1,Fecha1),
    getListaUsuParaDoc(Sn1,ListUsu1),
%    getListaDocParaDoc(Sn1,ListDoc),
    getListaHistorialParaDoc(Sn1,Historial1),
    getIdParaDoc(Sn1,Id1),
%    Id1 is Id2 + 1,
    not(pertenece(ListUsu1, Username)),
    usuario(Id1, Username, Password, [], Usuario),
    insertarAlPrincipio(Usuario, ListUsu1, ListUsu2),
    insertarAlPrincipio(Sn1, Historial1, Historial2),
    reemplazar(ListUsu1,ListUsu2, Sn1, Sn1A),
    reemplazar(Historial1,Historial2, Sn1A, Sn1B),
    reemplazar(Fecha1,Fecha, Sn1B, Sn2),
%    reemplazar(_,Id1, Sn1, Sn2),
    true, !.
%------------------------------------------------------------


insertarAlPrincipio( Elemento, [], [Elemento] ).
insertarAlPrincipio( Elemento, Lista, [Elemento|Lista] ).

insertarSinDuplicados( [], Elemento, [Elemento] ).
insertarSinDuplicados( [Elemento|Resto], Elemento, [Elemento|Resto] ) :- !.
insertarSinDuplicados( [Cabeza|Resto], Elemento, [Cabeza|NuevoResto] ):-
	insertarSinDuplicados( Resto, Elemento, NuevoResto ).

insertarAlFinal( Elemento, [], [Elemento] ).
insertarAlFinal( Elemento, [Cabeza|Resto], [Cabeza|Lista] ) :-
        insertarAlFinal( Elemento, Resto, Lista ).

pertenece([[_,Nombre,_,_]|_], Nombre):-!.
pertenece([[_,_,_,_]|Resto], Nombre):-
    pertenece(Resto,Nombre).


