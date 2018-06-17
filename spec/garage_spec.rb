require 'garage'


describe Garage do

  it { is_expected.to respond_to :fix_broken_bike }

  describe '#fix_broken_bike' do
    it 'fix broken bike' do
      station = DockingStation.new
      bike = Bike.new
      van = Van.new
      van.initalize
      garage = Garage.new
      garage.initalize
      station.report_bike_broken(Bike.new)
      broken_bikes_van_array = station.send_broken_bike_to_van(Bike.new, van)
      garage.fix_broken_bike(broken_bikes_van_array)
      expect(garage.fix_broken_bike_array.count).to eq 1
    end
  end



end
