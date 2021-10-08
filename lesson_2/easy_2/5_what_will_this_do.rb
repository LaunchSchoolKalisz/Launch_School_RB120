=begin
What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

This will print:
'ByeBye'
'HelloHello'

Because we are first calling the class method (self.dupdata) then using the instance variable
on that is initialized on line 18

=end