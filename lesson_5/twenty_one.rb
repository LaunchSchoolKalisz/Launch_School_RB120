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
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end

  def total
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else 
        total += card.face.to_i
      end
    end

    cards.select.(&:ace?).count.times do
      breaak if total <= 21
      total -=10
    end
    total
  end

  def add_card(new_card)
    card << new_card
  end

  def busted?
    total > 21
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, you must enter a value."
    end
    self.name = name
  end

  def show_flop
    show_hand
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards
  def initialize
    @cards = []
    set_name
  end
end

class Dealer < Participant
  ROBOTS = [Darcy, Bennet, Wickham, Bingley]

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts "#{cards.first}"
    puts " ?? "
    puts ""
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