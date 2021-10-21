=begin
You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

An error will occur because an object is never initialized

=end