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
require 'pry' 

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new("X")
    @computer = Player.new("O")
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end

  def human_moves
    puts "Choose a square:"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (1..9).include?(square)
      puts "Sorry, that's not a valid choice. Try again!"
    end

    binding.pry
    board.set_square_at(square, human.marker)
  end

  def play
    display_welcome_message
    loop do 
      display_board
      human_moves
      break if someone_won? || board_full?

      computer_moves
      break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end
end

class Board
  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new(key.to_s)}
  end

  def get_square_at(key)  
    @squares[key]         #will return a square object
  end
end

class Square
  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def play
  end
end

game = TTTGame.new
game.play