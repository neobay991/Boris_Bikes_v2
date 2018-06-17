require 'van'
require 'docking_station'
require 'garage'

describe Van do

  # checks if the release_bike method exists
  it { is_expected.to respond_to :send_broken_bike_to_garage }

  describe '#send_broken_bike' do
    it 'send a broken bike to van' do
      bike = Bike.new
      station = DockingStation.new
      van = Van.new
      garage = Garage.new
      station.report_bike_broken(bike)
      van.send_broken_bike_to_garage(bike, garage)
      expect(garage.fix_bike(bike)).to eq bike
    end
  end

  it { is_expected.to respond_to :return_fixed_bike }

  describe '#return_fixed_bike' do
    it 'collect a broken bike' do
      bike = Bike.new
      station = DockingStation.new
      van = Van.new
      garage = Garage.new
      station.report_bike_broken(bike)
      van.send_broken_bike_to_garage(bike, garage)
      garage.fix_bike(bike)
      van.return_fixed_bike(garage)
      expect(van.fixed_bikes.size).to eq 1
    end
  end

end
