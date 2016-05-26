class Bike

  def report_broken(bool=true)
     @bool = bool
  end

  def broken?
    @bool ||= false
  end
end


