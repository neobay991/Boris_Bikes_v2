require "docking_station"

describe DockingStation do

  # checks if the release_bike method exists
  it { is_expected.to respond_to :release_bike }

  # checks you can only release a bike after the bike is docked
  describe '#release_bike' do
    it 'release bike' do
      bike = double(:bike)
      station = double(:dockingstation, capacity: 20, dock_bike: true,
      report_bike_broken:true, release_bike: bike)
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
      bike = double(:bike, broken: false)
      station = double(:dockingstation, capacity: 20, dock_bike: true,
      report_bike_broken:true, release_bike: "no bikes available")
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
      20.times { subject.dock_bike(:bike) }
      expect{subject.dock_bike(:bike)}.to raise_error "no space available to dock bike"
    end
  end

  describe '#dock_bike' do
    it 'dock a bike' do
      station = DockingStation.new
      bike = double(:bike, broken: false)
      station.dock_bike(bike)
      #checking size of array to verify bike is docked
      expect(station.bikes.size).to eq 1
    end
  end

  describe '#dock_bike' do
    it 'dock a broken bike' do
      station = DockingStation.new
      bike = double(:bike, broken: false)
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
      station = double(:dockingstation, capacity: 20)
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  # checks a system maintainer can set capacity to overides the default value
  describe '#initalize' do
    it 'set a custom capacity when value set' do
      station = double(:dockingstation, capacity: 50)
      expect(station.capacity).to eq 50
    end
  end

  describe '#report_bike' do
    it 'reports bike as broken' do
      bike = double(:bike, broken: false)
      station = double(:dockingstation, report_bike_broken: false)
      expect(station.report_bike_broken(bike)).to eq false
    end
  end

  describe '#collect_fixed_bike_from_van' do
    it 'collect fixed bikes from Van' do
      station = DockingStation.new
      bike = Bike.new
      van = Van.new
      van.initalize
      garage = Garage.new
      garage.initalize
      fixed_bikes_van_array = [1]
      station.collect_fixed_bike_from_van(fixed_bikes_van_array)
      expect(station.bikes.count).to eq 1
    end
  end


end
