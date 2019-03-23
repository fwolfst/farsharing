module CarsHelper
  def display_name car
    car.name || "%s %s" % [car.manufacture, car.make]
  end
end
