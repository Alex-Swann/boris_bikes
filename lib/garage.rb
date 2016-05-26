require_relative 'bike'
require_relative 'container'

class Garage
  include Container
  def fix_bikes
    []
  end

end