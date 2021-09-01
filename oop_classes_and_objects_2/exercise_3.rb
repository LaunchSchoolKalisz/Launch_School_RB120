=begin
When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

We get the following error...

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

Why do we get this error and how do we fix it?
  We get this error because we used attr_reader which only gives us a getter method, and we are trying to set the name
  We can add attr_writer or attr_accessor
=end

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"