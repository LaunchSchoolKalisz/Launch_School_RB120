=begin
What is the default return value of to_s when invoked on an object? Where could you go to find out 
if you want to be sure?

to_s returns the object ID: "#<Cube:0x00007fc8ca11ff18>"

=end

class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

big_cube = Cube.new(5000)
p big_cube.to_s

=begin
LS Solution

By default, the to_s method will return the name of the object's class and an encoding of the 
object id.

If you weren't sure of this answer you could of course refer to Launch School's Object Oriented 
Programming book, but you could also refer directly to the Ruby documentation, in this case, 
here: http://ruby-doc.org/core/Object.html#method-i-to_s.
=end