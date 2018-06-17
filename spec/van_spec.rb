require 'van'

describe Van do

  it { is_expected.to respond_to :send_broken_bike }

  describe '#send_broken_bike_to_van' do
    it 'send broken bike to a van' do
      station = DockingStation.new
      bike = Bike.new
      van = Van.new
      1.times { station.report_bike_broken(Bike.new)}
      1.times { station.send_broken_bike_to_van(Bike.new, van) }
      expect(van.broken_bikes_van_array.count).to eq 1
    end
  end

  describe '#send_broken_bike_to_van' do
    it 'send 10 broken bikes to a van' do
      station = DockingStation.new
      bike = Bike.new
      van = Van.new
      10.times { station.report_bike_broken(Bike.new)}
      10.times { station.send_broken_bike_to_van(Bike.new, van) }
      expect(van.broken_bikes_van_array.count).to eq 10
    end
  end

  it { is_expected.to respond_to :collect_fixed_bikes }

  describe '#collect_fixed_bikes' do
    it 'receive broken bike' do
      station = DockingStation.new
      bike = Bike.new
      van = Van.new
      garage = Garage.new
      #van.send_broken_bike(Bike.new)
      garage.fix_broken_bike(van.send_broken_bike(bike))
      van.collect_fixed_bikes(garage)
      expect(garage.fix_broken_bike_array.count).to eq 1
    end
  end

  describe '#collect_fixed_bikes' do
    it 'receive broken bike' do
      station = DockingStation.new
      bike = Bike.new
      van = Van.new
      garage = Garage.new
      9.times { van.send_broken_bike(Bike.new) }
      garage.fix_broken_bike(van.send_broken_bike(bike))
      expect(garage.fix_broken_bike_array.count).to eq 10
    end
  end
end
