class PassagerTrain < Train

  def initialize(number_car)
     @type = 'passager'
      super
  end

  protected
  #Проверяем является car потомком класса PassagerCar
  def car_such_train?(car)
      car.is_a?(PassagerCar)
  end
end