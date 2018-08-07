require './lib/Docking_Station.rb'

describe DockingStation do

  it {is_expected.to respond_to :release_bike}

  it "Releases a bike and checks it works" do
    ds = subject
    ds.dock(Bike.new)
    bike = ds.release_bike
    expect(bike.is_a?(Bike) && bike.working?).to eq(true)
  end

  it {is_expected.to respond_to :dock}

  it "should dock a bike when #dock is called" do
    bike = Bike.new
    expect(subject.dock(bike).include?(bike)).to eq true
  end

  it {is_expected.to respond_to :bikes}

  it "will not release bike if none are present" do
    expect{subject.release_bike}.to raise_error("No bikes in Station")
  end

  it "will not accept bike if dock is full" do
    docking_station = subject
    10.times { docking_station.dock(Bike.new) }
    expect{docking_station.dock(Bike.new)}.to raise_error("Dock Full")
  end
end