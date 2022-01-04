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




% ---- TDA documento
% Formato: id documento - nombre documento - contenido documento - fecha documento - usuarios permitidos 
% Predicado TDA documento
%documento(IDdoc, NombreDoc, Contenido, FechaDoc, [IDdoc, NombreDoc, Contenido, FechaDoc, []]):-
%    integer(IDdoc), string(NombreDoc), string(Contenido).

% Sin verificaciones
documento(IDdoc, NombreDoc, Contenido, FechaDoc, [IDdoc, NombreDoc, Contenido, FechaDoc, ["permisos"],["historial"]]).

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
paradigmadoc(NombreParadoc, FechaParadoc, [NombreParadoc, FechaParadoc, ["lista_users"], ["lista_doc"], ["history"], 0, ["Sesion Actual"]]).

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
getSesionParaDoc([_,_,_,_,_,_,SA|_],SA).

% Como modificador
%reemplazar( _, _, [], []).
%reemplazar( Antiguo, Reemplazo , [Antiguo|Resto], [Reemplazo|NuevoResto] ):- 
%    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).
%reemplazar( Antiguo, Reemplazo, [Cabeza|Resto],[Cabeza|NuevoResto] ):- 
%    Cabeza \= Antiguo, 
%    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).




% - * Otras Funciones Necesarias * -
% Formato: lista usuarios - nombre de usuario
% Entrega: booleano si llega a pertenecer en la lista
perteneceN([[_,Nombre,_,_]|_], Nombre):-!.
perteneceN([[_,_,_,_]|Resto], Nombre):-
    perteneceN(Resto,Nombre).

% Formato: lista usuarios - contraseña de usuario
% Entrega: booleano si llega a pertenecer en la lista
perteneceC([[_,_,Contrasena,_]|_], Contrasena):-!.
perteneceC([[_,_,_,_]|Resto], Contrasena):-
    perteneceC(Resto,Contrasena).

% Formato: elemento a insertar - lista de elementos - lista anterior con el elemento ingresado 
% Entrega: lista entregada con el elemento ingresado al comienzo de la lista.
insertarAlPrincipio( Elemento, [], [Elemento] ).
insertarAlPrincipio( Elemento, Lista, [Elemento|Lista] ).

% Formato: lista de usuarios - nombre de usuario - contraseña del usuario - usuario que contiene el nombre y contraseña entregados dentro de la lista
% Entrega: usuario con nombre y contraseña ingresados
entregaUsuario([Usuario|_],Username,Password, Usuario):-
    getNombreUser(Usuario, Username),
    getContraUser(Usuario, Password).
entregaUsuario([_|Resto],Username, Password,Usuario):-
    entregaUsuario(Resto,Username, Password,Usuario).

% Formato: id - permiso
% Entrega: lista de permiso
permisoDoc(Id,Per,[Id,Per]).
    
% Formato: lista de documentos - primer documentod de la lista
% Entrega: primer documentod de la lista
getDocList(["lista_doc"],[0,_,_,_,_,_]).        
getDocList([Doc|_],Doc).


% Formato: lista de documentos - id - primer documentod de la lista
% Entrega: el documento de la lista que contenga el id
entregaDocumento([Documento|_],Id, Documento):-
    getIdDoc(Documento, Id).
entregaDocumento([_|Resto],Id,Documento):-
    entregaUsuario(Resto,Id,Documento).    
    
% Formato: lista de permisos del documento - permiso buscado
% Entrega: booleano que indica que existe el permiso en la lista
enPermisosDocList([Perm|_],Perm).
enPermisosDocList([_|Rest],Perm):-
    getPermisosDocList(Rest,Perm).



% --- MAIN --------------------------------------------------

% -Register
% Formato: ParadigmaDocs X date X string X string X ParadigmaDocs
% Predicado:
paradigmaDocsRegister(Sn1, Fecha, Username, Password, Sn2):-
    getFechaParaDoc(Sn1,Fecha1),
    getListaUsuParaDoc(Sn1,ListUsu1),
    getIdParaDoc(Sn1,Id1),
    Id2 is Id1 + 1,
    not(perteneceN(ListUsu1, Username)),
    usuario(Id1, Username, Password, [], Usuario),
    insertarAlPrincipio(Usuario, ListUsu1, ListUsu2),
    reemplazar(ListUsu1,ListUsu2, Sn1, Sn1A),
    reemplazar(Fecha1,Fecha, Sn1A, Sn1C),
    reemplazar(Id1,Id2, Sn1C, Sn2),
    true, !.

% - Ejemplo:
% paradigmaDocsRegister(PD1, F1, "Wakanda", "hola123", PD2).
% paradigmaDocsRegister(PD2, F2, "rSalas", "casas222", PD3).
% paradigmaDocsRegister(PD3, F2, "AntonioBanderas", "siNoTeHubierasIdo", PD4).



%------------------------------------------------------------

% -Login
% Formato: ParadigmaDocs X string X string X ParadigmaDocs
% Predicado:
paradigmaDocsLogin(Sn1, Username, Password, [NaP, FeP, ListUP, ListDoc, ListHP, Id, US]):-
    getNombreParaDoc(Sn1,NaP),
	getFechaParaDoc(Sn1,FeP),
	getListaUsuParaDoc(Sn1,ListUP),
    getListaDocParaDoc(Sn1,ListDoc),
	getListaHistorialParaDoc(Sn1,ListHP),
	getIdParaDoc(Sn1,Id),    
    entregaUsuario(ListUP, Username, Password, US), !.

% - Ejemplo:
% paradigmaDocsLogin(PD5, "Wakanda", "hola123", PD6).
% paradigmaDocsLogin(PD6, "rSalas", "casas222", PD7).
% paradigmaDocsLogin(PD8, "AntonioBanderas", "siNoTeHubierasIdo", PD9).


%------------------------------------------------------------

% -Create
% Formato: ParadigmaDocs X date X string X string X ParadigmaDocs
% Predicado:
paradigmaDocsCreate(Sn1, Fecha, Nombre, Contenido, [NaP, FeP, ListUP, ListDoc1, ListHP, Id, ["Sesion Actual"]]):-
    getNombreParaDoc(Sn1,NaP),
	getFechaParaDoc(Sn1,FeP),
	getListaUsuParaDoc(Sn1,ListUP),
	getListaHistorialParaDoc(Sn1,ListHP),
	getIdParaDoc(Sn1,Id),
    getSesionParaDoc(Sn1, SesionA),
    getIDUser(SesionA, Id0),
    permisoDoc(Id0, "A", Permiso),
    getListaDocParaDoc(Sn1,ListDoc),
    getDocList(ListDoc, Doc1),
    getIdDoc(Doc1, Id1),
    Id2 is Id1 + 1,
    documento(Id2, Nombre, Contenido, Fecha, Doc2),
    getUsuariosId(Doc2,UsuP1),
    insertarAlPrincipio(Permiso, UsuP1, UsuP2),
    reemplazar(UsuP1, UsuP2, Doc2, Doc3),
    insertarAlPrincipio(Doc3, ListDoc, ListDoc1), !.
    
% - Ejemplo:
% paradigmaDocsCreate(PD10, F3, "Primer Documento", "hola123", PD11).
% paradigmaDocsCreate(PD12, F3, "Tesis", "casas222", PD13).
% paradigmaDocsCreate(PD14, F4, "Carta para ", "siNoTeHubierasIdo", PD15).

%------------------------------------------------------------

% -Share
% Formato: ParadigmaDocs X integer X string list X string list X ParadigmaDocs
% Predicado: 
%paradigmaDocsShare(Sn1, DocumentId, ListaPermisos, ListaUsernamesPermitidos, Sn2):-
%   getNombreParaDoc(Sn1,NaP),
%	getFechaParaDoc(Sn1,FeP),
%	getListaUsuParaDoc(Sn1,ListUP),
%   getListaDocParaDoc(Sn1,ListDoc),
%	getListaHistorialParaDoc(Sn1,ListHP),
%	getIdParaDoc(Sn1,Id),
%   getSesionParaDoc(Sn1,SA),
    
%    entregaDocumento(ListDoc, DocumentId, DOC1),
%    getUsuariosId(DOC1,ListaIdPer),
    
%    getIDUser(SA,IDU),
%    permisoDoc(IDU, "A", PermisoA),
%    permisoDoc(IDU, "C", PermisoC),
%    (enPermisosDocList(ListaIdPer, PermisoA) ; enPermisosDocList(ListaIdPer, PermisoC)),
    
    
    

    

    

