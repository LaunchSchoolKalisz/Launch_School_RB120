=begin
We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

The code will print "You will" and then be completed by one of the "road trip" options:
"visit Vegas", "fly to Fiji", "romp in Rome" becaause the choices method in RoadTrip will be used
prior to the choices in Oracle, overriding it
=end