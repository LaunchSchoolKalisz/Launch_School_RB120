=begin
If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

In the make_one_year_older method we have used self. What is another way we could write this method so 
we don't have to use the self prefix?

  def make_one_year_older
    @age += 1
  end

LS Solution

self in this case is referencing the setter method provided by attr_accessor - this means that we could 
replace self with @. So the revised method would look something like this:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

This means in this case self and @ are the same thing and can be used interchangeably.
=end