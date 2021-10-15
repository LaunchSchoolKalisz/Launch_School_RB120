# Game Orschestration Engine

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "The computer, #{computer.name}, chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must by y or n"
    end

    return true if answer == 'y'
    false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def>(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def<(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice. Choose again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

RPSGame.new.play

=begin
Potential Bonus Features

Below are some ideas for features or additions to our Rock, Paper, Scissors game.

Keeping score
Right now, the game doesn't have very much dramatic flair. It'll be more interesting 
if we were playing up to, say, 10 points. Whoever reaches 10 points first wins. Can you build 
this functionality? We have a new noun -- a score. Is that a new class, or a state of an 
existing class? You can explore both options and see which one works better.

Add Lizard and Spock
This is a variation on the normal Rock Paper Scissors game by adding two more options - Lizard 
and Spock. The full explanation and rules are here.

Add a class for each move
What would happen if we went even further and introduced 5 more classes, one for each move: 
Rock, Paper, Scissors, Lizard, and Spock. How would the code change? Can you make it work? 
After you're done, can you talk about whether this was a good design decision? What are the 
pros/cons?

Keep track of a history of moves
As long as the user doesn't quit, keep track of a history of moves by both the human and computer. 
What data structure will you reach for? Will you use a new class, or an existing class? What will 
the display output look like?

Computer personalities
We have a list of robot names for our Computer class, but other than the name, there's really 
nothing different about each of them. It'd be interesting to explore how to build different 
personalities for each robot. For example, R2D2 can always choose "rock". Or, "Hal" can have a 
very high tendency to choose "scissors", and rarely "rock", but never "paper". You can come up 
with the rules or personalities for each robot. How would you approach a feature like this?
=end
