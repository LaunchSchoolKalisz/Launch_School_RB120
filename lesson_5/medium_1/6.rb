=begin
Number Guesser Part 1

Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per 
game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
Note that a game object should start a new game with a new number to guess with each call to #play.

=end

class GuessingGame
  def initialize
    @count = 7
    @winning_num = (1..100).to_a.sample
  end

  def play
    loop do
      p @winning_num
      break if @count <= 0
      count
      guess = player_guess
      loop do
        break if validate_guess(guess)
        guess = player_guess
      end
      if guess == @winning_num
        puts "That's the number!"
        break 
      end
      feedback(guess)
      puts "\n"
    end
  end

  def count
    puts "You have #{@count} guesses remaining."
    @count -= 1
    puts "Enter a number between 1 and 100:"
  end

  def player_guess
    guess = gets.chomp.to_i
  end

  def validate_guess(guess)
    return true if (1..100).to_a.include?(guess)
    puts "Invalid guess. Enter a number between 1 and 100:"
    false
  end

  def feedback(guess)
    if guess > @winning_num
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
  end
  
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!