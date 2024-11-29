# Problema-classico-dos-saltos-do-cavalo-no-jogo-de-xadrez

Código em Prolog que encontra o caminho completo do cavalo em um tabuleiro de xadrez de tamanho RxC usando a heurística de Warnsdorf. 

O objetivo é visitar todas as casas do tabuleiro sem repeti-las.

Para fazer uma consulta utilize _caminho_cavalo(R, C, X, Y, [], Caminho). onde R e C são o tamanho do tabuleiro e X e Y são as coordenadas de onde o cavalo irá iniciar, como por exemplo:
_caminho_cavalo(8, 8, 0, 0, [], Caminho).
