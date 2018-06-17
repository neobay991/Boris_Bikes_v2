require_relative 'bike'

class DockingStation

  # using a Constant to set capacity of the dock station
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :bikes

  def initialize(custom_capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = custom_capacity
  end

  def release_bike
    # this is a guard condition that also includes a predicate method
    # (i.e. dock_capacity_empty?)
    fail 'no bikes available' if dock_capacity_empty?

    #fail 'no working bikes left to release' unless @bike_working == true

    # remove the last value in the array i.e. release 1 bike
    @bikes.pop
  end

  def dock_bike(bike)
    # this is a guard condition that also includes a predicate method
    # (i.e. dock_capacity_full?)
    fail 'no space available to dock bike' if dock_capacity_full?

    # add a value to the array i.e. add 1 bike
    @bikes << bike
  end

private

# using attr_reader to make the instance variable :bikes (@bikes)
# available outside the Class


  def dock_capacity_full?
    @bikes.count >= @capacity
  end

  def dock_capacity_empty?
    @bikes.empty?
  end
end

=begin
###### local debugging ######
# require './lib/docking_station'
# require './lib/bike'

station = DockingStation.new(4)
bike = Bike.new

# doc 10 bikes
2.times {station.dock_bike(bike)}

# see if the bikes are stored in the array (docking capacity)
puts "bikes stored in array: " + station.bikes.count.to_s

puts "bike working " + bike.working?.to_s

#bike.broken?
#puts "bike broken " + bike.broken?.to_s


puts "report bike broken "
bike.report_bike

puts "bike working2 " + bike.working?.to_s
puts "bike working3 " + station.bike_working?.to_s


# release 5 bikes
1.times {station.release_bike}

# see if the bikes are removed from the array (docking capacity)
puts "bikes stored in array after releasing bike: " + station.bikes.count.to_s
=end
