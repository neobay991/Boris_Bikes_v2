require "bike"

describe Bike do
  it { is_expected.to respond_to :working? }
end

describe '#initalize' do
  it 'check the bike is not broken when a new bike object is created' do
    bike = Bike.new
    expect(bike.initalize).to eq true
  end
end

describe '#working?' do
  it 'reports bike as NOT working after being reported broken' do
    bike = Bike.new
    station = DockingStation.new(1)
    station.dock_bike(bike)
    bike.report_bike
    expect(bike.working?).to eq false
  end
end


describe '#broken?' do
  it 'reports bike as NOT working after being reported broken' do
    bike = Bike.new
    station = DockingStation.new(1)
    station.dock_bike(bike)
    bike.report_bike
    expect(bike.broken?).to eq false
  end
end
