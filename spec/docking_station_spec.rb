require "docking_station"

describe DockingStation do

  # this test is checking if the release_bike method exists
  it { is_expected.to respond_to :release_bike }

  # this test is checking that you can only release a
  # bike after the bike is docked
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

  # this test is checking if the doc_bike method exists
  it { is_expected.to respond_to :dock_bike }

  # this test is checking capacity , if the capacity exceeds
  # 20, throw an error
  describe '#dock_bike' do
    it 'raise an error if no capacity available' do
      20.times { subject.dock_bike(Bike.new) }
      expect{subject.dock_bike(Bike.new)}.to raise_error "no space available to dock bike"
    end
  end

  # this test is checking if I can parse the doc_bike method 1 argument
  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  # ***** TO DO *******
  # add a test for attribute reader

  # this test is checking if the dock_capacity_full method exists
  it { is_expected.to respond_to :dock_capacity_full? }

  # this test is checking if the dock_capacity_empty method exists
  it { is_expected.to respond_to :dock_capacity_empty? }
=begin
  # this test is checking if the dock is full
begin
  describe '#dock_full?' do
    it 'checks that the dock is full' do
      station = DockingStation.new
      bike = Bike.new
      20.times {subject.dock_bike(bike)}
      expect(subject.dock_bike(bike)).to eq 20

    end
  end





  # this test is checking if the dock is full
  describe '#dock_empty?' do
    it 'checks that the dock is empty' do
      station = DockingStation.new
      bike = Bike.new
      20.times {subject.dock_bike(bike)}
      20.times {subject.release_bike}
      expect(subject.release_bike).to eq 1
    end
  end
=end

end
