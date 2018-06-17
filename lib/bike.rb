# understands if a bike is working or not
class Bike
  attr_accessor :bike_working

  def initialize
    @bike_working = true
  end

  def working?
    @bike_working
  end

  def broken
    @bike_working = false
  end
end
