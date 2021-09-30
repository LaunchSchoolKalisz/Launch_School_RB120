=begin
Using the class definition from step #3, let's create a few more people -- that is, Person 
objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
If we're trying to determine whether the two objects contain the same name, how can we compare 
the two objects?

=end

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

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

def same_name?(person_1, person_2)
  return true if person_1.first_name == person_2.first_name && person_1.last_name == person_2.last_name
  false
end

p same_name?(rob, bob)