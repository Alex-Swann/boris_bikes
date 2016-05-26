

module Container


  def load_bikes(arg=[])
    @storage = []
    @storage << arg #  Van.new.load_bikes(station.bikes)
    @storage
  end

  def unload_bikes(arg=[])
    arg << @storage
    arg
  end
end