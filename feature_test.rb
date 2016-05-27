require './lib/bike.rb'
require './lib/docking_station.rb'
require './lib/van.rb'
require './lib/garage.rb'

station = DockingStation.new
bike = Bike.new
garage = Garage.new
van = Van.new

5.times{ station.dock(Bike.new) }
2.times{ station.dock(Bike.new,true) }
p station.bikes

