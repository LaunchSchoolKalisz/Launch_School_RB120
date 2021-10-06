=begin
Now create a smart name= method that can take just a first name or a full name, and knows how 
to set the first_name and last_name appropriately.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'
=end

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts[0]
    @last_name =  parts.size > 1 ? parts.last : ''
  end

  def name
   "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split
    @first_name = parts[0]
    @last_name =  parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

=begin
LS solution

We actually already did this in the initialize method, so we can just repeat it for the 
name= method. Note that Ruby gives us a special syntax for methods that end in =, so the 
name= method can be used like this: bob.name = 'Robert Smith', rather than the more 
awkward bob.name=('Robert Smith').

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

Note the redundant code in the initialize and the name= methods. Let's move that to another 
method to DRY up the code. Our new method can be private, since it's not being used outside of 
the class definition.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

=end