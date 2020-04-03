class CargoTrain < Train

  def initialize(number_car)
    @type = 'cargo'
    super
  end

  protected
  def car_such_train?(car)
    car.is_a?(CargoCar)
  end

end