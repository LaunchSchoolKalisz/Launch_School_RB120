=begin
Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

Will print the person object which will not look very user friendly:
  The person's name is: #<Person:0x00007fd2a495a488>

Let's add a to_s method to the class:

class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end
Now, what does the below output?

YAY! Looks way better now:
  The person's name is: Robert Smith

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
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

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"