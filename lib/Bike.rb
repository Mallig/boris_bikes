# Bike class, simple stuff
class Bike
  def initialize
    @status = true
  end

  def working?
    @status
  end

  def report
    @status = false
    'Bike reported as Broken'
  end
end
