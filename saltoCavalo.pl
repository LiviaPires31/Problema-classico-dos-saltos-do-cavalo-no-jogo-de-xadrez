%1a parte (5 ptos)
%Para fazer uma consulta utilize �caminho_cavalo(R, C, X, Y, [], Caminho).�, onde R e C � o
%tamanho do tabuleiro e X e Y s�o as coordenadas de onde o cavalo ir� iniciar, como por exemplo:
%�caminho_cavalo(8, 8, 0, 0, [], Caminho).�

% moviementos_cavalo/4 - predicado auxiliar que define os movimentos poss�veis do %cavalo
movimentos_cavalo(X, Y, NovoX, NovoY) :-
( NovoX is X - 1, NovoY is Y - 2
; NovoX is X - 1, NovoY is Y + 2
; NovoX is X + 1, NovoY is Y - 2
; NovoX is X + 1, NovoY is Y + 2
; NovoX is X - 2, NovoY is Y - 1
; NovoX is X - 2, NovoY is Y + 1
; NovoX is X + 2, NovoY is Y - 1
; NovoX is X + 2, NovoY is Y + 1 ).

% movimentos_possiveis_cavalo/7 - predicado que verifica se uma nova posi��o � v�lida e %n�o foi visitada antes
movimentos_possiveis_cavalo(R, C, X, Y, Visitados, NovoX, NovoY) :-
movimentos_cavalo(X, Y, NovoX, NovoY),
NovoX > 0, NovoX =< R,
NovoY > 0, NovoY =< C,
not(member((NovoX, NovoY), Visitados)).

% numero_movimentos_possiveis/6 - predicado que retorna o n�mero de poss�veis %movimentos a partir de uma posi��o
numero_movimentos_possiveis(R, C, X, Y, Visitados, Count) :-
findall(_, movimentos_possiveis_cavalo(R, C, X, Y, Visitados, _, _), Movimentos),
length(Movimentos, Count).

% warnsdorff/8 - predicado que encontra o pr�ximo movimento do cavalo, utilizando a %heur�stica de Warnsdorff
warnsdorff(R, C, X, Y, Visitados, NovoX, NovoY, Score) :-
movimentos_possiveis_cavalo(R, C, X, Y, Visitados, NovoX, NovoY),
numero_movimentos_possiveis(R, C, NovoX, NovoY, [(NovoX, NovoY) | Visitados], Score).

% caminho_cavalo/6 - predicado que encontra o caminho completo do cavalo
caminho_cavalo(R, C, X, Y, Visitados, Caminho) :-
length(Visitados, L),
L =:= R * C - 1,
reverse([(X, Y) | Visitados], Caminho).

caminho_cavalo(R, C, X, Y, Visitados, Caminho) :-
length(Visitados, L),
L< R * C - 1,
warnsdorff(R, C, X, Y, Visitados, NovoX, NovoY, _Score),
NovosVisitados = [(NovoX, NovoY) | Visitados],
caminho_cavalo(R, C, NovoX, NovoY, NovosVisitados, Caminho).

