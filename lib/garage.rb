require_relative 'bike'

class Garage

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def load_broken_bikes(location)
    @bikes += location.bikes.select {|bike| bike.broken?}
    location.bikes.delete_if {|bike| bike.broken? }
    @bikes
  end

  def unload_fixed_bikes(location)
    location.bikes += @bikes.select {|bike| !bike.broken?}
    @bikes.delete_if {|bike| !bike.broken?}
    @bikes
  end

  def fix_bikes
    @bikes.map!{|bike| bike.report_broken(false)}
  end

end