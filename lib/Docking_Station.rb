class DockingStation
    attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
      @bikes = []
  end

  def release_bike
    station_empty? ? raise("No bikes in Station") : @bikes.pop
  end

  # *** Make station_full? and station_empty? private ***
  def station_full?
    @bikes.length == DEFAULT_CAPACITY
  end

  def station_empty?
    @bikes.empty?
  end
    
  def dock(bike)
    station_full? ? raise("Dock Full") : @bikes << bike
  end

end

class Bike
  def working?
    true
  end
end
