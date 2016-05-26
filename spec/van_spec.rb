require 'van'
require 'docking_station'
require 'garage'
require 'bike'

describe Van do

  it '#load_bikes' do
    station = DockingStation.new
    station.dock(Bike.new, true)
    expect(Van.new.load_bikes).to include(Bike)
    expect(station.bikes).to eq []
  end

  it '#unload_bikes' do
    van = Van.new
    van.load_bikes
    expect(van.unload_bikes).to eq []
  end

end