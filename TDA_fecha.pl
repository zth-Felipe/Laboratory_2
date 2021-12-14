%----------------------TDAs--------------------.

% TDA Fecha
% D: dia
% M: mes
% Y: año

fecha(D,M,Y,[D,M,Y]):-
    number(D),number(M),number(Y).

esfecha?(D,M,Y):-
    fecha(D,M,Y,_).
