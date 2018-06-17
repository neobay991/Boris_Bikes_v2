require 'bike'

describe Bike do
  describe '#initialize' do
    it 'check the bike is not broken when a new bike object is created' do
      bike = double(:bike, initialize: true)
      expect(bike.initialize).to eq true
    end
  end

  it { is_expected.to respond_to :working? }

  describe '#working?' do
    it 'reports bike as NOT working after being reported broken' do
      bike = double(:bike, broken: true, working?: false)
      station = DockingStation.new(1)
      station.dock_bike(bike)
      station.report_bike_broken(bike)
      expect(bike.working?).to eq false
    end
  end

  describe '#broken' do
    it 'reports bike as NOT working after being reported broken' do
      bike = double(:bike, broken: false)
      station = DockingStation.new(1)
      station.dock_bike(bike)
      station.report_bike_broken(bike)
      expect(bike.broken).to eq false
    end
  end
end
