# Conect4-Haskell
@ Functional Programming Course

2 playeri
-om
-computer

campul:
lista de liste
arrays

Board:
7 coloane
6 linii
"_ _ _ _ _ _ "1
"_ _ _ _ _ _ "2
"_ _ _ _ _ _ "3
"_ _ _ _ _ _ "4
"_ _ _ _ _ _ "5
"_ _ _ _ _ _ "6
"_ _ _ _ _ _ "7
 1 2 3 4 5 6 
[[1..6],[1..6], [1..6],[1..6], [1..6],[1..6],[1..6]] length=7,6

Move:
o functie care schimba starea tablei de joc
--in lista y(1,7) adauga 
move [[a]] y 'x'= [[a]]
move [[a]] y '0'= [[a]]


nr= numarul coloanei pe care vrea sa introduca 1..7

read nr : coloana este plina ->> read until 
is_boardfull= 3
is_movewin= 2
board-disp

calculatorul pune random (1,7)
is_boardfull= 3
is_movewin= 2
board-disp


conect4 tu> 6
conect4> Tabla e/nu plina
conect4> Mutare castigatoare
conect4 pc> 5

conect4> restart
conect4> exit

player simbols "a" "b"

computer strtegy:
1. pune daca mai are una sa castige
2. pune sa nu castige celalalt
3. pune random

algoritmul minimax
--joc 20 jocuri si cate castig 

--tine minte tabla 
--o structura care sa se stie daca a castigat cineva
