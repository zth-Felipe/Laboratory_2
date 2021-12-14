
% TDA Estudiantes
% (id, nombre, rut, carrera)

estudiante(1, joaquin, "11111", informatica).
estudiante(2, alan, "12121", logistica).
estudiante(3, hernan, "23232", medicina).
estudiante(4, dante, "42424", psicología).

% TDA Nota estudiante
% (id, nota, ramo)

estudiante_nota(1, 1, "eda").
estudiante_nota(1, 4, "calculo1").
estudiante_nota(2, 6, "eda").
estudiante_nota(2, 3, "fisica").

% Reglas
%	meta principal: Nombre, Nota
%	meta secundaria: Id

findNotasPorEstudiante(Nombre, Nota):-
	estudiante(Id, Nombre, _, _),
	estudiante_nota(Id, Nota, _).