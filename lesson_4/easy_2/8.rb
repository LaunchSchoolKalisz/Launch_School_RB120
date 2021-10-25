=begin
If we have this class:

class Game
  def play
    "Start the game!"
  end
end

And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

What can we add to the Bingo class to allow it to inherit the play method from the Game class?

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

LS solution
To tell Ruby that the Bingo class will inherit from the Game class we need to put it after the 
class name when defining the Bingo class. An example of this would look like:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

To test this code out we will need to create a new instance of the class Bingo and then call the 
play method on that instance, as you can see below:

>> game_of_bingo = Bingo.new
=> #<Bingo:0x007f9d19b537c8>
>> game_of_bingo.play
=> "Start the game!"
=end