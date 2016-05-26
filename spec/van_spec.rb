require 'van'
require 'docking_station'
require 'garage'
require 'bike'

describe Van do

  it '#load_broken_bikes' do
    station = DockingStation.new
    bike1 = Bike.new
    bike2 = Bike.new
    station.dock(bike1, true)
    station.dock(bike2, false)
    expect(Van.new.load_broken_bikes(station)).to eq [bike1]
    expect(station.bikes).to eq [bike2]
  end

  it '#unload_broken_bikes' do
    station = DockingStation.new
    bike1 = Bike.new
    bike2 = Bike.new
    station.dock(bike1, true)
    station.dock(bike2, false)
    van = Van.new
    van.load_broken_bikes(station)
    garage = Garage.new
    expect(van.unload_broken_bikes(garage)).to eq []
    expect(garage.bikes).to eq [bike1]
  end

end