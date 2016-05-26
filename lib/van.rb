require_relative 'docking_station'
require_relative 'garage'

class Van

  attr_accessor :bikes

  def initialize(bikes = [])
    @bikes = bikes
  end

  def load_bikes(location)
    if location.instance_of? DockingStation
       @bikes += location.bikes.select {|bike| bike.broken?}
      location.bikes.delete_if {|bike| bike.broken? }
    else location.instance_of? Garage
      @bikes += location.bikes.select {|bike| !bike.broken?}
      location.bikes.delete_if {|bike| !bike.broken? }
    end
    @bikes
  end


  def unload_bikes(location)
     if location.instance_of? DockingStation
      location.bikes += @bikes.select {|bike| !bike.broken?}
      @bikes.delete_if {|bike| !bike.broken? }
    else location.instance_of? Garage
      location.bikes += @bikes.select {|bike| bike.broken?}
      @bikes.delete_if {|bike| bike.broken? }
    end
    @bikes
  end

end




