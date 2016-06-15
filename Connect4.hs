import Data.Char
import Data.List
import System.IO

--editare AFISARE 
v2 = ["123456","4321","1234","","123456","0","xx0"]
--prelucrare afisare
line_fill []="_|_|_|_|_|_"
line_fill (x:xs)
	| l < 6 = intersperse '|' ( (x:xs) ++ replicate (6-l) '_' )
	| otherwise = intersperse '|' (x:xs)
	where l= length (x:xs)

board_fill_endl []= "\n1|2|3|4|5|6" --board_fillnn
board_fill_endl (y:ys)= line_fill y ++ "\n" ++ board_fill_endl ys

board_disp [] = putStrLn $ board_fill_endl emptyBoardModel
board_disp (z:zs) = putStrLn $ board_fill_endl (z:zs)
----------------------
--putStrLn $ board_fill_endl $ transpose ["xxxoxo","xooo","xoox","xxoo","xox","xoo","xxx"]
--transpose ["xxxoxo","xooo","xoox","xxoo","xox","xoo","xxx"]=>["xxxxxxx","xooxoox","xoooxox","ooxo","x","o"]
--xxxxxxx
--xooxoox
--xoooxox
--ooxo__
--x_____
--o_____
--1234567
-----------
-------------------------------
copy c [] = c:[]
copy c (x:xs)  =  (x:xs) ++ c:[]
-------------------------------
--
possibleMoves bs = map fst $ filter (\(a , _)-> length (bs!!(a-1)) <6) $ zip [1..7] bs
------
--AI
mijloc m@(x:xs) = head. drop ((length m) `div` 2) $ m
------
-- MOVE chr coloana
add:: Char -> Int -> [String] -> [String]
add c x  []= add c x emptyBoardModel
add c x (y:ys) = ((take ( x-1 ) (y:ys)) ++ (copy c ((y:ys)!!(x-1))):[] )++ (drop (x) (y:ys))
----------------------------

emptyBoardModel = replicate 7 ""
--let res = add (head ("abc")) (read ("1")::Int) (replicate 7 "")


gameloop bs@(x:xs) = do 
	
	putStrLn "Alege una din optiunile disponibile>"
	putStrLn $ show $ possibleMoves bs
	putStr "c4 MOVE >"
	hFlush stdout
	linie <- getLine
	
	let tokens = words linie
	
	if head tokens == "quit" 
	then do
		return ()
	else do
		if length tokens == 2 
		then do
			
			--LOOP
			if (read (tokens!!1) :: Int) `elem` (possibleMoves bs)
			then do 
				----------MY MOVE
				let result = add (head (tokens!!0)) (read (tokens!!1) :: Int) (x:xs)
				--is win E ?? printStrLn "E WIN" board_disp result return ()
				----------AI MOVE
				let result_and_aiMove = add 'A' (mijloc $ possibleMoves result) result
				--is win A ??
				
				--AFISARE
				board_disp result_and_aiMove
				----------NEXT MOVE
				gameloop result_and_aiMove
				
			else do 
				putStrLn ""
				putStrLn "Incearca dinnou"
				gameloop (x:xs)
		else do
			return ()

main = do 
	putStrLn "Welcome to Connect 4"
	putStrLn "Scrie simbolul de pus pe tabla si un numar de la 1 la 7"
	putStrLn "Atentie se adauga de la dreapta l astanga nu de sus in jos"
	board_disp emptyBoardModel
	gameloop emptyBoardModel
	putStrLn "Game Over"