require 'garage'

describe Garage do

  it { is_expected.to respond_to :fix_broken_bike }

  describe '#fix_broken_bike' do
    let(:bike) { Bike.new }

    it 'fix broken bike' do
      station = DockingStation.new
      bike = double(:bike)
      van = Van.new
      garage = Garage.new
      station.report_bike_broken(Bike.new)
      broken_bikes_van_array = station.send_broken_bike_to_van(double(:bike), van)
      garage.fix_broken_bike(broken_bikes_van_array)
      expect(garage.fix_broken_bike_array.count).to eq 1
    end
  end
end
