require_relative 'bike'

class DockingStation
  # using attr_reader to make the instance variable :bike (@bike)
  # available outside the Class
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    # this is a guard condition
    fail 'no bikes available' if dock_capacity_empty?

    # remove the last value in the array i.e. release 1 bike
    @bikes.pop
  end

  def dock_bike(bike)
    # this is a guard condition
    fail 'no space available to dock bike' if dock_capacity_full?

    # add a value to the array i.e. add 1 bike
    @bikes << bike
  end

  def dock_capacity_full?
    @bikes.count >= 20
  end

  def dock_capacity_empty?
    @bikes.empty?
  end

=begin
this method is not required, since we are using attr_reader :bike
to read the instance variable
  def docked_bike
    @bike
  end
=end
end


###### local debugging ######
# require './lib/docking_station'
# require './lib/bike'

station = DockingStation.new
bike = Bike.new

# doc 10 bikes
20.times {station.dock_bike(bike)}

# see if the bikes are stored in the array (docking capacity)
puts "bikes stored in array: " + station.bikes.count.to_s

# release 5 bikes
5.times {station.release_bike}

# see if the bikes are removed from the array (docking capacity)
puts "bikes stored in array after releasing bike: " + station.bikes.count.to_s

# see if the docking station is full (true/false)
puts "Docking station full: " + station.dock_capacity_full?.to_s

# see if the docking station is empty (true/false)
puts "Docking station empty: " +  station.dock_capacity_empty?.to_s
