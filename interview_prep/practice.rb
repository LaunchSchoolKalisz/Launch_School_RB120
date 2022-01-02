class Person
  def initialize(name)
    @name = name
  end

  def name
    puts "Hi, my name is #{@name}"
  end
end

marts = Person.new("Martha")
marts.name