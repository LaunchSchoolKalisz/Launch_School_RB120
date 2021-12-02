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
      total += assign_points(card)
    end

    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def assign_points(card)
    if card.ace?
      11
    elsif card.jack? || card.queen? || card.king?
      10
    else
      card.face.to_i
    end
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
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

class Dealer < Participant
  ROBOTS = ["Darcy", "Bennet", "Wickham", "Bingley"]

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts cards.first.to_s
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
    "The #{face} of #{suit}"
  end

  def face
    case @face
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
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def player_turn
    puts "#{player.name}'s turn..."

    loop do
      if hit_or_stay == 's'
        puts "#{player.name} stays!"
        break
      else
        show_player_move
        break if player.busted?
      end
    end
  end

  def hit_or_stay
    puts "Would you like to (h)it or (s)tay?"

    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Sorry, must enter 'h' or 's'."
    end
    answer
  end

  def dealer_turn
    puts "#{dealer.name}'s turn..."

    dealer_options
  end

  def dealer_options
    loop do
      if dealer.total >= 17 && !dealer.busted?
        puts "#{dealer.name} stays!"
        break
      elsif dealer.busted?
        break
      else
        show_hit(dealer)
      end
    end
  end

  def show_hit(user)
    user.add_card(deck.deal_one)
    puts "#{user.name} hits!"
  end

  def show_busted
    if player.busted?
      puts "#{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "#{dealer.name} busted! #{player.name} wins!"
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_result
    if player.total > dealer.total
      puts "#{player.name} wins!"
    elsif player.total < dealer.total
      puts "#{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def show_player_move
    show_hit(player)
    player.show_hand
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, your must respond with y or n."
    end
    answer == 'y'
  end

  def start
    loop do
      system 'clear'
      deal_cards
      show_flop

      player_turn
      if player.busted?
        show_busted
        break unless play_again?
        reset
        next
      end

      dealer_turn
      if dealer.busted?
        show_busted
        break unless play_again?
        reset
        next
      end

      show_cards
      show_result
      play_again? ? reset : break
    end
    puts "Thank you for playing Twenty-One. Goodbye!"
  end
end

game = TwentyOne.new
game.start
