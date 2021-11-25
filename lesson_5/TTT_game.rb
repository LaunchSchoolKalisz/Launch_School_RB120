require 'pry'

module Displayable
  def match_display(scores)
    display_instructions
    display_scoreboard(scores)
    display_board
  end

  def match_display_and_clear(scores)
    system_clear
    display_instructions
    display_scoreboard(scores)
    display_board
  end

  def match_result_display(scores)
    display_scoreboard(scores)
    display_match_winner(scores)
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

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_instructions
    puts "The first player to #{TTTGame::NUMBER_OF_WINS_TO_WIN} wins, wins the game!"
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
end

class TTTGame
  include Displayable

  HUMAN_MARKER = " X "
  COMPUTER_MARKER = " O "
  NUMBER_OF_WINS_TO_WIN = 2

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    system_clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      match_sequence(scores)
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def match_sequence(scores)
    chooser = who_chooses_who_goes_first
    loop do
      player = choose_player_one(chooser)
      match_display_and_clear(scores)
      move(player, scores)
      reset
      break if scores.values.include?(NUMBER_OF_WINS_TO_WIN)
      display_scoreboard(scores)
    end
    match_result_display(scores)
  end

  def move(player, scores)
    player_move(player, scores)
    update_scoreboard(scores)
    clear_screen_and_display_board
  end

  def player_move(player_one, scores)
    loop do
      current_player_moves(player_one, scores)
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def scores
    scores = { human: 0, computer: 0 }
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
    square = comp_move(TTTGame::COMPUTER_MARKER)
    if !square
      square = comp_move(TTTGame::HUMAN_MARKER)
    end
    if !square
      square = comp_choose_square
    end
    board[square] = computer.marker
  end

  def comp_move(marker)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = board.find_at_risk_square(line, marker)
      break if square
    end
    square
  end

  def comp_choose_square
    if board.unmarked_keys.include?(5)
      5
    else
      board.unmarked_keys.sample
    end
  end

  def choose_player_one(chooser)
    if chooser == 'human'
      human_chooses_player_one
    else
      ['human', 'computer'].sample
    end
  end

  def human_chooses_player_one
    puts ""
    puts "Who should go first: human or computer?"
    player_one = nil
    loop do
      player_one = gets.chomp.downcase
      break if player_one == "human" || player_one == "computer"
      puts "Please enter a valid response: human or computer"
    end
    player_one
  end

  def current_player_moves(player_one, scores)
    if player_one == "human"
      human_moves
      computer_moves unless board.someone_won? || board.full?
    else
      computer_moves
      match_display_and_clear(scores)
      human_moves unless board.someone_won? || board.full?
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

  def who_chooses_who_goes_first
    puts "Who should choose who goes first: human or computer?"
    chooser = nil
    loop do
      chooser = gets.chomp.downcase
      break if chooser == "human" || chooser == "computer"
      puts "Please enter a valid response: human or computer"
    end
    chooser
  end

  def system_clear
    system 'clear'
  end

  def reset
    board.reset
    system_clear
  end
end

class Board
  include Displayable

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

  def gather_markers(squares)
    squares.select(&:marked?).collect(&:marker)
  end

  def three_identical_markers?(squares)
    markers = gather_markers(squares)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def find_at_risk_square(line, marker)
    sqrs = @squares.values_at(*line)
    markers = gather_markers(sqrs)
    if two_markers?(markers, marker)
      sq = square_to_mark(markers, marker)
      idx = markers.index(sq.join)
      return @squares.key(sqrs[idx])
    end
    nil
  end

  def square_to_mark(markers, marker)
    markers.select do |square|
      if markers.count(marker) == 2
        square != marker
      end
    end
  end

  def two_markers?(markers, marker)
    other_marker = other_marker(marker)
    if markers.count(marker) == 2 && markers.include?(other_marker) == false
      true
    else
      false
    end
  end

  def other_marker(marker)
    if marker == TTTGame::COMPUTER_MARKER
      TTTGame::HUMAN_MARKER
    else
      TTTGame::COMPUTER_MARKER
    end
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new("[#{key}]") }
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
