class Bike
  attr_accessor :bike_working

  def initalize
    @bike_working = true
  end

  def working?
    @bike_working
  end

#  def report_bike
#    @bike_working = false
#  end

  def broken
    @bike_working = false
  end
end
