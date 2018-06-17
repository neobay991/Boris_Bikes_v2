require 'docking_station.rb'

class Van
  VAN_DEFAULT_COUNTER = 5
  attr_accessor :broken_bikes_van_array
  attr_accessor :fixed_bikes_van_array

  def initalize()
    @broken_bikes_van_array = []
    @fixed_bikes_van_array = []
  end

  def send_broken_bike(bike)
    @broken_bikes_van_array << bike
  end

  def collect_fixed_bikes(garage)
    garage.fix_broken_bike_array.each do |fixed_bikes|
      @fixed_bikes_van_array << fixed_bikes
    end

  end

end
