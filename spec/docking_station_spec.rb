require "docking_station"

describe DockingStation do

  # checks if the release_bike method exists
  it { is_expected.to respond_to :release_bike }

  # checks you can only release a bike after the bike is docked
  describe '#release_bike' do
    it 'release bike' do
      bike = Bike.new
      station = DockingStation.new
      station.dock_bike(bike)
      expect(station.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raise an error if no bikes available' do
      expect{subject.release_bike}.to raise_error "no bikes available"
    end
  end

  describe '#release_bike' do
    it 'unable to release a broken bike' do
      bike = Bike.new
      station = DockingStation.new
      20.times { station.dock_bike(bike) }
      station.report_bike_broken(bike)
      expect(station.release_bike).to eq "no bikes available"
    end
  end

  # checks if the doc_bike method exists
  it { is_expected.to respond_to :dock_bike }

  # checks capacity, if the capacity exceeds 20, throw an error
  describe '#dock_bike' do
    it 'raise an error if no capacity available' do
      20.times { subject.dock_bike(Bike.new) }
      expect{subject.dock_bike(Bike.new)}.to raise_error "no space available to dock bike"
    end
  end

  describe '#dock_bike' do
    it 'dock a bike' do
      station = DockingStation.new
      bike = Bike.new
      station.dock_bike(bike)
      #checking size of array to verify bike is docked
      expect(station.bikes.size).to eq 1
    end
  end

  describe '#dock_bike' do
    it 'dock a broken bike' do
      station = DockingStation.new
      bike = Bike.new
      station.report_bike_broken(bike)
      station.dock_bike(bike)
      #checking size of array to verify bike is docked
      expect(station.bikes.size).to eq 1
    end
  end

  # checks if I can parse the doc_bike method 1 argument
  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  # checks the default capacity is set if no custom capacity is parsed
  describe '#initalize' do
    it 'set default capacity value when no value set' do
      station = DockingStation.new
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  # checks a system maintainer can set capacity to overides the default value
  describe '#initalize' do
    it 'set a custom capacity when value set' do
      station = DockingStation.new(50)
      expect(station.capacity).to eq 50
    end
  end

  describe '#report_bike' do
    it 'reports bike as broken' do
      bike = Bike.new
      station = DockingStation.new
      expect(station.report_bike_broken(bike)).to eq false
    end
  end

end
