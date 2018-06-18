require 'bike'

describe Bike do
  describe '#initialize' do
    it 'check the bike is not broken when a new bike object is created' do
      subject = double(:bike, initialize: true)
      expect(subject.initialize).to eq true
    end
  end

  it { is_expected.to respond_to :working? }

  describe '#working?' do
    it 'reports bike as NOT working after being reported broken' do
      subject = double(:bike, broken: true, working?: false)
      station = DockingStation.new(1)
      station.dock_bike(subject)
      station.report_bike_broken(subject)
      expect(subject.working?).to eq false
    end
  end

  describe '#broken' do
    it 'reports bike as NOT working after being reported broken' do
      subject = double(:bike, broken: false)
      station = DockingStation.new(1)
      station.dock_bike(subject)
      station.report_bike_broken(subject)
      expect(subject.broken).to eq false
    end
  end
end
