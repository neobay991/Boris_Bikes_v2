require 'docking_station'

# understands how to collect broken bikes from the Van Class and fix them
class Garage
  attr_accessor :fix_broken_bike_array

  def initialize
    @fix_broken_bike_array = []
  end

  def fix_broken_bike(broken_bikes_van_array)
      broken_bikes_van_array.each do | broken_bike |
        @fix_broken_bike_array << broken_bike
      end
  end
end
