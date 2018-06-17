require_relative 'bike'
require_relative 'van'

# understands how to cock and release bikes and also report broken bikes
class DockingStation
  # using a Constant to set capacity of the dock station
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :bikes
  attr_reader :bike_working

  def initialize(custom_capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = custom_capacity
    @bike_working = true
    #van = Van.new
  end

  def release_bike
    # this is a guard condition that also includes a predicate method
    # (i.e. dock_capacity_empty?)
    fail 'no bikes available' if dock_capacity_empty?

    if @bike_working == true
    # remove the last value in the array i.e. release 1 bike
      @bikes.pop
    else
      "no bikes available"
    end
  end

  def dock_bike(bike)
    # this is a guard condition that also includes a predicate method
    # (i.e. dock_capacity_full?)
    fail 'no space available to dock bike' if dock_capacity_full?

    # add a value to the array i.e. add 1 bike
    @bikes << bike
  end

  def report_bike_broken(bike)
    #@bike_working = false
    @bike_working = bike.broken
  end

  def send_broken_bike_to_van(bike, van)
    if @bike_working == false
    van.send_broken_bike(bike)
    end
  end

  def collect_fixed_bike_from_van(fixed_bikes_van_array)
    fixed_bikes_van_array.each do |fixed_bikes|
      @bikes << fixed_bikes
    end
  end

private

  def dock_capacity_full?
    @bikes.count >= @capacity
  end

  def dock_capacity_empty?
    @bikes.empty?
  end
end
