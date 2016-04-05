function [oldX, oldY, newX, newY] = aggressive(Checkers, player)

oldX = -1;
oldY = -1;
newX = -1;
newY = -1;

canTakePiece = false;

for iy = 1 : 8
    for ix = 1 : 8
        if Checkers.myBoard(ix, iy) == player || Checkers.myBoard(ix, iy) == player + 2
            moves = findMoves(Checkers.myBoard(ix, iy));
            for i = 1 : length(moves)
                currentMove = cell2mat(moves(i));
                if abs(currentMove(2) - iy) == 2
                    canTakePiece = true;
                    oldX = ix;
                    oldY = iy;
                    newX = currentMove(1);
                    newY = currentMove(2);
                    break
                end
            end
        end
    end
end


if canTakePiece == false
    for iy = 1 : 8
        for ix = 1 : 8
            if Checkers.myBoard(ix, iy) == player || Checkers.myBoard(ix, iy) == player + 2
                moves = findMoves(Checkers.myBoard(ix, iy));
                if moves ~= 0
                    randomMove = moves(randi(length(moves)));
                    currentMove = cell2mat(randomMove);
                    oldX = ix;
                    oldY = iy;
                    newX = currentMove(1);
                    newY = currentMove(2);
                    break
                end
            end
        end
    end
end