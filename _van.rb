
class Van


  # using a Constant to set capacity of the van
  DEFAULT_CAPACITY_VAN = 1

  attr_accessor :capacity_van
  attr_reader :fixed_bikes

  def initialize
    @fixed_bikes = []
    @van_capacity = 1
  end

  def send_broken_bike_to_garage(bike, garage)
    fail "no more!" if van_capacity_full?
    garage.fix_bike(bike)
  end

  def return_fixed_bike(garage)
    @fixed_bikes << garage.fix_bike(bike)
  end

  private

  def van_capacity_full?
    @van_capacity = 1
  end

  def van_capacity_empty?
    @fixed_bikes.empty?
  end

end
