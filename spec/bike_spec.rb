require 'Bike'

describe Bike do

  it 'is expected to work on creation' do
    expect(subject).to be_working
  end

  it "is can be reported as broken" do
    expect(subject.report).to eq("Bike reported as Broken")
  end

end