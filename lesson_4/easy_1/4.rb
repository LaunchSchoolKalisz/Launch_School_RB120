=begin
If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end
=end

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

otis = AngryCat.new

=begin
LS Solution
You can define a new instance of the AngryCat class like this:

AngryCat.new
Using the .new after the class name will tell Ruby this new object is an instance of AngryCat.
=end
