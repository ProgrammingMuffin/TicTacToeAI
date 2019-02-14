--[[
 ___________________________
|							|
|							|
|   Tic Tac Toe AI program	|
|       By: Deepak R		|
|							|
|___________________________|

Information:

Gameboard, 2 = BLANK, 3 = X, 5 = O

]]--

local Board = 
{
	2, 2, 2,
	2, 2, 2,
	2, 2, 2
};

local won = 0;
local turn = 1;

function PrintBoard()
	local char;
	for i=1, #Board do
		if Board[i] == 2 then
			char = "-    ";
		elseif Board[i] == 3 then
			char = "X    ";
		elseif Board[i] == 5 then
			char = "O    ";
		end
		io.write(char .. "\t");
		if i%3 == 0 then
			print("\n\n");
		end
	end
end

function Make2()
	if Board[5] == 2 then
		return 5;
	else
		for i=2, 8, 2 do
			if Board[i] == 2 then
				return i;
			end
		end
	end
end


	end
	return 0;
end

function Go(n)
	if turn%2 == 0 then
		Board[n] = 5;
	else
		Board[n] = 3;
	end
	turn = turn + 1;
end

function sleep(n)
  if n > 0 then os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") end
end

function findBlank()
	for i=1, #Board do
		if Board[i] == 2 then
			return i;
		end
	end
end

os.execute("cls");
PrintBoard();

while won == 0 do
	if turn == 1 then
		Go(1);
	elseif turn == 2 then
		if Board[5] == 2 then
			Go(5);
		else
			Go(1);
		end
	elseif turn == 3 then
		if Board[9] == 2 then
			Go(9);
		else
			Go(3);
		end
	elseif turn == 4 then
		if Posswin(3) == 0 then
			Go(Make2());
		else
			Go(Posswin(3));
		end
	elseif turn == 5 then
		if Posswin(3) ~= 0 then
			Go(Posswin(3));
		elseif Posswin(5) ~= 0 then
			Go(Posswin(5));
		elseif Board[7] == 2 then
			Go(7);
		else
			Go(3);
		end
	elseif turn == 6 then
		if Posswin(5) ~= 0 then
			Go(Posswin(5));
		elseif Posswin(3) ~= 0 then
			Go(Posswin(3));
		else
			Go(Make2());
		end
	elseif turn == 7 or turn == 9 then
		if Posswin(3) ~= 0 then
			Go(Posswin(3));
		elseif Posswin(5) ~= 0 then
			Go(Posswin(5));
		else
			Go(findBlank());
		end
	elseif turn == 8 then
		if Posswin(5) ~= 0 then
			Go(Posswin(5));
		elseif Posswin(3) ~= 0 then
			Go(Posswin(3));
		else
			Go(findBlank());
		end
	end
	sleep(2);
	os.execute("cls");
	PrintBoard();
end
