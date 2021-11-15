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
  HUMAN_MARKER = " X "
  COMPUTER_MARKER = " O "

  attr_reader :board, :human, :computer

  def play
    system_clear
    display_welcome_message

    loop do
    display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full? 
        clear_screen_and_display_board if human_turn?
      end

      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    system_clear
    display_board
  end

  def display_board
    puts ""
    puts "You are#{human.marker}. Computer is#{computer.marker}."
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose an empty square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice. Try again!"
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    human_moves if human_turn?
    computer_moves unless board.someone_won? || board.full? 
  end

  def human_turn?
    return true if board.count_human_marker((1..9).to_a) == board.count_computer_marker((1..9).to_a) 
    false
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, your response must be y or n"
    end

    answer == 'y'
  end

  def system_clear
    system 'clear'
  end

  def reset
    board.reset
    system_clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

class Board
  WINNING_LINES = 
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + #rows
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + #columns
    [[1, 5, 9], [3, 5, 7]]             #diags
  
  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  #TTT_game.rb:159:in `[]=': undefined method `marker=' for nil:NilClass (NoMethodError)
  
  def []
    @squares[key]
  end

  def unmarked_keys
    human_marked_keys = @squares.keys.select {|key| @squares[key].human_marked?}
    computer_marked_keys = @squares.keys.select {|key| @squares[key].computer_marked?}
    unmarked_keys = @squares.keys - human_marked_keys - computer_marked_keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_human_marker(squares)
    squares.collect.count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect.count(TTTGame::COMPUTER_MARKER)
  end

  #return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line| 
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def reset
    (1..9).each {|key| @squares[key] = Square.new("[#{key.to_s}]")}
  end

  def draw
    puts "       |       |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "       |       |"
    puts "-------+-------+-------"
    puts "       |       |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "       |       |"
    puts "-------+-------+-------"
    puts "       |       |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "       |       |"
  end

end

class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end

  def human_marked?
    marker == TTTGame::HUMAN_MARKER
  end

  def computer_marked?
    marker == TTTGame::COMPUTER_MARKER
  end

   def marked?
     marker != (human_marked? && computer_marked?)
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

game = TTTGame.new
game.play
