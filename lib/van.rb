require_relative 'docking_station'
require_relative 'garage'

class Van

  attr_accessor :bikes

  def initialize(bikes = [])
    @bikes = bikes
  end
  
  #loads all broken bikes in 'location' into the van and returns the total bikes now in the van.
  def load_broken_bikes(location)
    @bikes += location.bikes.select {|bike| bike.broken?}
    location.bikes = location.bikes.delete_if {|bike| bike.broken? }
    @bikes
  end

  #unloads all broken bikes currently held in the van over to the 'location' returns the total bikes now in the van.
  def unload_broken_bikes(location)
    location.bikes += @bikes.select {|bike| bike.broken?}
    @bikes = @bikes.delete_if {|bike| bike.broken?}
    @bikes
  end

end

station = DockingStation.new
bike1 = Bike.new
bike2 = Bike.new
station.dock(bike1, true)
station.dock(bike2, false)
van = Van.new
van.load_broken_bikes(station)
garage = Garage.new



