require 'docking_station'

describe DockingStation do
  subject(:station) { described_class.new }
  let(:bike) { double(:bike) }

  it 'responds to release_bike' do
    expect(station).to respond_to(:release_bike)
  end

  it 'responds to dock' do
    expect(station).to respond_to(:dock).with(1).argument
  end

  it 'shows bikes' do
    allow(bike).to receive(:report_broken) { false }
    station.dock(bike)
    expect(station.bikes[0]).to eq bike
  end

  it 'exception when bike released with none docked' do
    expect{station.release_bike}.to raise_error 'No bikes in station!'
  end

  it 'exception when dock full' do
    allow(bike).to receive(:report_broken) { false }
    expect{ (DockingStation::DEFAULT_CAPACITY+1).times { station.dock(bike)} }.to raise_error "Dock full!"
  end

  it 'set default capacity and reads it' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    expect(station.capacity = 10).to eq 10
    expect(station.capacity = 2).to eq 2
  end

  it '#dock reports broken bike' do
    allow(bike).to receive(:report_broken) { true }
    expect(station).to respond_to(:dock).with(2).argument

    allow(bike).to receive(:broken?) { true }
    expect(station.dock(bike,true)[0]).to be_broken

    allow(bike).to receive(:broken?) { false }
    expect(station.dock(bike,false)[1]).to_not be_broken
  end

  it "#release_bike doesn't release broken bikes" do
    allow(bike).to receive(:report_broken) { true }
    allow(bike).to receive(:broken?) { true }
    station.dock(bike,true)
    expect(station.release_bike).to eq "No bikes available. Remainder broken!"
  end
end


