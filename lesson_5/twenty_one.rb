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
  attr_accessor :cards
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

class Card
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{suit} of #{face}}"
  end

  def face
    case face
    when 'J' then "Jack"
    when 'Q' then "Queen"
    when 'K' then "King"
    when 'A' then "Ace"
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  ends
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