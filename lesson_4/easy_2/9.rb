=begin
If we have this class:

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

What would happen if we added a play method to the Bingo class, keeping in mind that there is 
already a method of this name in the Game class that the Bingo class inherits from.

The play method in the Bingo class would override the play method in the game class

LS Solution

If we added a new method to the Bingo class as seen below, it will use that method instead of 
looking up the chain and finding the Game class's method. Because Ruby doesn't want to look all 
over the place, as soon as it finds a method that matches it uses that - so in this case it is 
really first come first served.

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Eyes down"
  end
end
=end