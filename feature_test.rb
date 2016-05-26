require './lib/bike.rb'
require './lib/docking_station.rb'
require './lib/van.rb'
require './lib/garage.rb'

station = DockingStation.new
bike = Bike.new
garage = Garage.new
van = Van.new


p station.dock(bike,true)

p station.bikes
p station.load_van


