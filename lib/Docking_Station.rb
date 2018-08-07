class DockingStation
    attr_reader :bikes

    def initialize
        @bikes = []
    end

    def release_bike
        bikes.empty? ? raise("No bikes in Station") : @bikes.pop
    end
    
    def dock(bike)
        @bikes.length > 9 ? raise("Dock Full") : @bikes << bike
    end

end

class Bike
    def working?
        true
    end
end
