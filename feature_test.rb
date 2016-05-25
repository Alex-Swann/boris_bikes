require './lib/bike.rb'
require './lib/docking_station.rb'

station = DockingStation.new
bike = Bike.new

p station.dock(bike)
p station.dock(bike)
p station.dock(bike,true)
p bike.broken?


