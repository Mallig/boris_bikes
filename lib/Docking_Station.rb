class DockingStation
    attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes = []
  end

  #is this still a guard clause?
  def release_bike
    station_empty? ? raise("No bikes in Station") : bikes.pop
  end
  
  def dock(bike)
    station_full? ? raise("Dock Full") : bikes << bike
  end
  
  private
  def station_full?
    bikes.length >= capacity
  end

  def station_empty?
    bikes.empty?
  end

end