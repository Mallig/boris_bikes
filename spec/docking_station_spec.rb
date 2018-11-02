require 'Docking_Station'

describe DockingStation do
  let(:mockWorkingBike) { double :bike, working?: true }
  let(:mockBrokenBike)  { double :bike, working?: false }

  describe '#release_bike' do
    it 'releases bikes' do
      subject.dock(mockWorkingBike)
      expect(subject.release_bike).to eq(mockWorkingBike)
    end

    it 'only releases working bikes' do
      subject.dock(mockWorkingBike)
      subject.dock(mockBrokenBike)
      expect(subject.release_bike).to be_working
    end

    it 'will not release bike if none working are present' do
      subject.dock(mockBrokenBike)
      expect { subject.release_bike }
        .to raise_error 'No working bikes in Station'
    end
  end

  describe '#dock()' do
    it 'should dock a bike' do
      expect(subject.dock(mockWorkingBike)).to include(mockWorkingBike)
    end

    it 'will not accept bike if dock is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(mockWorkingBike) }
      expect { subject.dock(mockWorkingBike) }
        .to raise_error 'Dock Full'
    end
  end

  it 'can accept a capacity argument' do
    limit = rand(200)
    subject = DockingStation.new(limit)
    limit.times { subject.dock(mockWorkingBike) }
    expect { subject.dock(mockWorkingBike) }.to raise_error 'Dock Full'
  end
end
