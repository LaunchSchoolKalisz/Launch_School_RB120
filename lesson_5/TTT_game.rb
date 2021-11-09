=begin 
GAME DESCRIPTION

Tic tac toe is a 2 player game. The game is set up with a 9-square grid. Player 1 marks the board with an x. Player 2 counters
with their marker, an o. The players take turns, tryng to mark 3 consecutive squares on the grid with their markers (winner).

LS Description
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.

Nouns: board, player, grid, square, marker
Verbs: play, mark

Board
Square
Player
  - Mark
  - Play

SPIKE
=end

class TTTGame
  def play
  end
end

class Board
  def initialize
    # Need to model 9 suare (3x3) grid
    # Dataa structure: Array vs hash for Square objects; integers/strings?
  end
end

class Square
  def initialize
    # Status to keep track of the square's mark?
  end
end

class Player
  def initialize
    # Marker to keep track of player's symbol?
  end

  def mark
  end

  def play
  end
end

game = TTTGame.new
game.play