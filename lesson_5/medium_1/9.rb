=begin
Deck of Cards
Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing 
cards. Use the following code to start your work:

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end

The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized 
and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.

Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, 
very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you 
almost certainly have something wrong.

=end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def draw
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

=begin
Solution

# insert Card class from previous exercise here

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

Discussion
The initialization code for our Deck is in the #reset method of our class. We put it here and not in #initialize 
since we need to periodically create a new set of cards, and it's easier to do that in a separate method. Since the 
method is not intended for public use (it could be though), we make it private.

The #reset method works by combining the RANKS and SUITS Arrays with Array#product, which produces an Array of 
nested 2-element Arrays. We convert that to an Array of Card objects using #map.

The #draw method is relatively straightforward: we just call reset if there are no more cards remaining, then we 
remove the topmost card from the deck.

=end
