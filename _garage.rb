require_relative 'bike'
require_relative 'docking_station'
require_relative 'van'

class Garage

  # using a Constant to set capacity of the van

  attr_accessor :capacity
  attr_accessor :fixed_bike

  def initialize

  end

  def fix_bike(bike)
    @fixed_bike = bike
  end
end
