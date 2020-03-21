class Train
  #показывает колличесвто вагонов  и изменяем его
  attr_accessor :number_car

  #набирает(устанавливает) скорость и возвращает скорость
  attr_accessor :speed

  #показываем станции, перемещаемся по ним
  attr_accessor :station

#Принятие маршрута(запись)  и получение, чтобы вытянуть станции из него
  attr_accessor :route

  def initialize(type, number_car)
    @type = type
    @number_car = number_car
    @speed = 0
    @route
  end

#поезда набирает скорость, к предыдущей добавляем новую V
  def rize_speed(speed)
    @speed += speed
  end

#поезд тормозит
  def stop
    @speed = 0
  end


#добавляем 1 вагон
  def add_car
    if @speed == 0
      @number_car += 1
    else
      puts"You need to stop the train"
    end
  end

#убираем 1 вагон
  def delete_car
    if @speed == 0
      @number_car -= 1
    else
      puts"You need to stop the train"
    end
  end

#not work
  def get_route(route)
    route.each{|station| puts station}
  end

end
 


class RailwayStation

  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
      @trains.push(train)
  end

  def delete_train
    @trains.pop
  end

#not work
  def trains_by_type(type) 
    @trains.each do |train|
      if train.type == type
        puts train
      end
    end
  end

#not work
  def show_trains
    @trains.each do |train| 
      puts rain
    end
  end


end


class Route

  attr_reader :first_station
  attr_reader :last_station
  attr_accessor :route

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @route = []
    @route.push(first_station)
    @route.push(last_station)
  end
  def add_station(station)
    @route.insert(-2, station)
  end

  def delete_station(station)
    @route.delete_if{|index| index == station}
  end

  def show_route
    @route.each{|station| puts station}
  end
end
