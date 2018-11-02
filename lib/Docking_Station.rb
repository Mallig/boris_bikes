# Docking Station for holding and releasing bikes to members of the public
class DockingStation
  attr_reader :working_bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise('No working bikes in Station') if station_empty?

    working_bikes.pop
  end

  def dock(bike)
    raise('Dock Full') if station_full?

    bike.working? ? working_bikes << bike : @broken_bikes << bike
  end

  private

  def station_full?
    working_bikes.length + @broken_bikes.length >= capacity
  end

  def station_empty?
    working_bikes.empty?
  end
end
