require "docking_station"

describe DockingStation do

  # checks if the release_bike method exists
  it { is_expected.to respond_to :release_bike }

  # checks you can only release a bike after the bike is docked
  describe '#release_bike' do
    it 'release working bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raise an error if no bikes available' do
      expect{subject.release_bike}.to raise_error "no bikes available"
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

end
