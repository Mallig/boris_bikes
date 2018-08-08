require 'Docking_Station'
require 'Bike'

describe DockingStation do

  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to :bikes}
  it {is_expected.to respond_to :dock}
  it {is_expected.to respond_to :station_full?}

  it "Releases a bike" do
    dock = subject
    dock.dock(Bike.new)
    expect(dock.release_bike).to be_a(Bike)
  end

  it "should dock a bike when #dock is called" do
    bike = Bike.new
    expect(subject.dock(bike)).to include(bike)
  end

  it "will not release bike if none are present" do
    expect{subject.release_bike}.to raise_error("No bikes in Station")
  end

  it "will not accept bike if dock is full" do
    dock = subject
    20.times { dock.dock(Bike.new) }
    expect{ dock.dock(Bike.new) }.to raise_error("Dock Full")
  end

end