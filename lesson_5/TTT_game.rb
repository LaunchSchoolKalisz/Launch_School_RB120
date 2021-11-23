require 'pry'

class TTTGame
  HUMAN_MARKER = " X "
  COMPUTER_MARKER = " O "
  NUMBER_OF_WINS_TO_WIN = 2

  attr_reader :board, :human, :computer

  def play
    system_clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      match_sequence
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def match_sequence
    scores = { human: 0, computer: 0 }
    loop do
      match_display(scores)
      player_move
      update_scoreboard(scores)
      display_result
      reset
      break if scores.values.include?(NUMBER_OF_WINS_TO_WIN)
    end
    match_result_display(scores)
  end

  def match_display(scores)
    display_instructions
    display_scoreboard(scores)
    display_board
  end

  def match_result_display(scores)
    display_scoreboard(scores)
    display_match_winner(scores)
  end

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

  def joinor(nums, punctuation = ", ", conjunction = "or")
    case nums.count
    when 1
      nums.join(punctuation.to_s)
    when 2
      "#{nums[0]} #{conjunction} #{nums[1]}"
    else
      last_num = nums.pop
      nums.join(punctuation.to_s) + "#{punctuation}#{conjunction} #{last_num}"
    end
  end

  def human_moves
    puts "Choose an empty square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice. Try again!"
    end

    board[square] = human.marker
  end

  def computer_moves
    square = nil
    Board::WINNING_LINES.each do |line|
      square = board.find_at_risk_square(line, board)
      break if square
    end

    if !square
      square = board.unmarked_keys.sample
    end

    board[square] = computer.marker
  end

  def current_player_moves
    human_moves if human_turn?
    computer_moves unless board.someone_won? || board.full?
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_turn?
    ary = (1..9).to_a
    if board.count_human_marker(ary) == board.count_computer_marker(ary)
      return true
    end
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

  def display_instructions
    puts "The first player to #{NUMBER_OF_WINS_TO_WIN} wins, wins the game!"
  end

  def update_scoreboard(scores)
    case board.winning_marker
    when human.marker
      scores[:human] += 1
    when computer.marker
      scores[:computer] += 1
    end
    scores
  end

  def display_scoreboard(scores)
    puts ""
    puts "------SCOREBOARD------"
    puts "You have #{scores[:human]} points."
    puts "Computer has #{scores[:computer]} points."
  end

  def display_match_winner(scores)
    puts ""
    if scores[:human] > scores[:computer]
      puts "Congrats! You won the match!"
    else
      puts "Sorry, the computer won the match. Better luck next time!"
    end
    puts ""
  end
end

class Board
  WINNING_LINES =
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
    [[1, 5, 9], [3, 5, 7]] # diags

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def []
    @squares[key]
  end

  def unmarked_keys
    human_marked_keys = @squares.keys.select do |key|
      @squares[key].human_marked?
    end
    computer_marked_keys = @squares.keys.select do |key|
      @squares[key].computer_marked?
    end
    @squares.keys - human_marked_keys - computer_marked_keys
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

  # return winning marker or nil
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
    (1..9).each { |key| @squares[key] = Square.new("[#{key}]") }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def find_at_risk_square(line, board)
    sqrs = @squares.values_at(*line)
    markers = sqrs.select(&:marked?).collect(&:marker)
    if two_markers?(markers)
      square_to_mark = markers.select do |square|
        if markers.count(TTTGame::HUMAN_MARKER) == 2
          square != TTTGame::HUMAN_MARKER  
        elsif markers.count(TTTGame::COMPUTER_MARKER) == 2
          square != TTTGame::COMPUTER_MARKER 
        end
      end
      idx = markers.index(square_to_mark.join)
      return @squares.key(sqrs[idx])
    end
    nil
  end

  def two_markers?(markers)
    if markers.count(TTTGame::HUMAN_MARKER) == 2 && (markers.include?(TTTGame::COMPUTER_MARKER) == false)
      return true
    elsif markers.count(TTTGame::COMPUTER_MARKER) == 2 && (markers.include?(TTTGame::HUMAN_MARKER) == false)
      return true
    else
      return false
    end
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
