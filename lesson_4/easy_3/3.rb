=begin
When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class with separate names and 
ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

=end

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

first_cat = AngryCat.new(1, "Kitty")
second_cat = AngryCat.new(5, "Old Guy")

first_cat.age
second_cat.name

=begin
LS Solution

When we create the AngryCat objects, we pass the constructor two values -- an age and a name. These 
values are assigned to the new object's instance variables, and each object ends up with different 
information.

To show this, lets create two cats.

henry = AngryCat.new(12, "Henry")
alex   = AngryCat.new(8, "Alex")
We now have two different instances of the AngryCat class.

You will have noticed there is no new method inside of the AngryCat class, so how does Ruby know what to 
do when setting up the objects? By default, Ruby will call the initialize method on object creation.

Now we can confirm that each of our cats are different by asking for their ages and names.

>> henry.name
Henry
>> henry.age
12
>> alex.name
Alex
>> alex.age
8

As you can see, they have two different sets of attributes from when they were created.
=end