require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes in station!' if empty?
    new_bike = @bikes.find{|bike| !bike.broken? }

    if new_bike != nil
       @bikes.delete(new_bike)
       new_bike
    else
      "No bikes available. Remainder broken!"
    end
  end

  def dock(bike, user_report_broke=false)
     raise "Dock full!" if full?
     bike.report_broken(user_report_broke)
     @bikes << bike
  end

  private

  def full?
    @bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end

station = DockingStation.new
bike = Bike.new


p station.dock(Bike.new,false)[0].broken?
p station.dock(Bike.new,true)[1].broken?

p station.bikes
p station.release_bike
p station.bikes
p station.release_bike

