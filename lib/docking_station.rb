require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = 0
  end

  def release_bike
    raise "No bikes available!" unless @bikes > 0
    @bikes -= 1
    Bike.new
  end

  def dock(bike)
    raise "Dock station at capacity!" unless @bikes < 1
    @bikes += bike
    Bike.new
  end
end
