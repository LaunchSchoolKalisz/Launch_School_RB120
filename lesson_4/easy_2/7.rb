=begin
If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Explain what the @@cats_count variable does and how it works. What code would you need to write to 
test your theory?

Cats count increments by 1 when a new Cat is initialized

To test:
=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

p Cat.cats_count
tabby_cat = Cat.new('tabby')
p Cat.cats_count

=begin
LS Solution

The @@cats_count variable is here to keep track of how many cat instances have been created. We 
can know this because of where in the code the number incremented.

Every time we create a cat using Cat.new("tabby") we will be creating a new instance of the class 
Cat. During the object creation process it will call the initialize method and here is where we 
increment the value of the @@cats_count variable.

To test your theory you could print the value of the @@cats_count variable to the screen after it 
has been incremented, like this:

def initialize(type)
  @type = type
  @age  = 0
  @@cats_count += 1
  puts @@cats_count
end

If you did this when you created more cats you could verify that the value was incremented.

>> Cat.new(‘tabby’)
1
=> #<Cat:0x007fe05a0aebe0 @type=“tabby”, @age=0>
>> Cat.new(‘russian blue’)
2
=> #<Cat:0x007fe05a0a74d0 @type=“russian blue”, @age=0>
>> Cat.new(‘shorthair’)
3
=> #<Cat:0x007fe05a0a2d40 @type=“shorthair”, @age=0>
=end