=begin
Write a class that will display:

ABC
xyz

when the following code is run:

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
=end

module Caseable
end

class Transform
  attr_accessor :words

  def initialize(words)
    @words = words
  end

  def self.lowercase(words = @words)
    words.downcase
  end

  def uppercase(words = @words)
    words.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')