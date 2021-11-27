=begin
21 Game

Discription: 21 is a card game. Consists of a dealer and a player. 
Each player's goal is to reach as close to 21 as possible without going over.

Overview
- Start with a 52-card deck
- Each player gets 2 cards 
- The player goes first: can hit or stay
- If the player busts, they lose the game. If they stay, it is the dealer's turn
- The dealer must hit until his cards add up to at least 17.
- If dealer busts, the player wins. 
- If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.

Major Nouns and Verbs
Nouns: deck, card, player, dealer, total, deck, game
Verbs: hit, stay, win, lose, busts

Organize 

Player
- Hit
- Stay
- Total 
- Busted?

Dealer
- Hit
- Stay
- Total 
- Busted?

Deck
- Deal

Card
- Value

Game
- Start
=end

module Hand
end

class Player
  include Hand
  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total 
    # need info about cards
  end
end

class Dealer
  include Hand
  def hit
  end

  def stay
  end

  def busted?
  end

  def total 
    # need info about cards
  end
end

class Deck
  def initialize
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Card
  def initialize
    # what are the "states" of a card?
  end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.starts