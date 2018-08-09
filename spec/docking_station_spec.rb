require 'Docking_Station'
require 'Bike'

describe DockingStation do

  let(:mockWorkingBike) {double :bike, working?: true}
  let(:mockBrokenBike)  {double :bike, working?: false}
  
  it "Releases a bike" do
    subject.dock(mockWorkingBike)
    expect(subject.release_bike).to be_working
  end

  it "should dock a bike when #dock is called" do
    expect(subject.dock(mockWorkingBike)).to include(mockWorkingBike)
  end

  it "will not release bike if none are present" do
    expect{subject.release_bike}.to raise_error "No bikes in Station"
  end

  it "will not accept bike if dock is full" do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(mockWorkingBike) }
    expect{ subject.dock(mockWorkingBike) }.to raise_error "Dock Full"
  end
  
  it "can accept a capacity argument" do
    limit = rand(200)
    subject = DockingStation.new(limit)
    limit.times { subject.dock(mockWorkingBike) }
    expect{ subject.dock(mockWorkingBike) }.to raise_error "Dock Full"
  end
end
