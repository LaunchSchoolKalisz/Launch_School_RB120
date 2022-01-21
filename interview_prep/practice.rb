class Student
  def initialize(grade)
    @grade = grade
  end

  def >(other)
    grade > other.grade
  end

  protected

  attr_reader :grade
end

bob = Student.new(80)
john = Student.new(90)

p bob > john # => false
p john > bob # => true
puts john.grade 
