require 'Docking_Station'
require 'Bike'

describe DockingStation do

  it "Releases a bike" do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_a(Bike)
  end

  it "should dock a bike when #dock is called" do
    bike = Bike.new
    expect(subject.dock(bike)).to include(bike)
  end

  it "will not release bike if none are present" do
    expect{subject.release_bike}.to raise_error "No bikes in Station"
  end

  it "will not accept bike if dock is full" do
    20.times { subject.dock(Bike.new) }
    expect{ subject.dock(Bike.new) }.to raise_error "Dock Full"
  end

end