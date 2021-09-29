class Person
  attr_accessor :name 

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name                  # => 'Robert'

# LS solution

#A nice, simple class with one getter/setter.

class Person
  attr_accessor :name

  def initialize(n)
    @name = n
  end
end