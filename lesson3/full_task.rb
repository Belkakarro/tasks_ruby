class Train
  #показывает колличесвто вагонов  и изменяем его
  attr_accessor :number_car

  #набирает(устанавливает) скорость и возвращает скорость
  attr_accessor :speed

  #показываем станции, перемещаемся по ним
  attr_accessor :station

#Принятие маршрута(запись)  и получение, чтобы вытянуть станции из него
  attr_accessor :route_train
  attr_reader :route
  attr_accessor :stations

  def initialize(type, number_car)
    @type = type
    @number_car = number_car
    @speed = 0
    @route_train
  end

#поезда набирает скорость, к предыдущей добавляем новую V
  def rize_speed(speed)
    @speed += speed
  end

#поезд тормозит
  def stop
    @speed = 0
  end


#добавляем 1 вагон()
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

  def get_route(route)
    @route_train = route
    @station = self.route_train.stations.first
  end

  def show_stations
      @route_train.stations.each do |station| 
        puts station
      end
  end

  def previous_station
    @route_train.stations[route_train.stations.index(self.station) - 1]
  end

  def next_station
    @route_train.stations[route_train.stations.index(self.station) + 1]
  end

  def move_next_station
    self.station = self.route_train.stations[route_train.stations.index(self.station) + 1]
  end
end
 


class RailwayStation

  attr_accessor :trains
  attr_reader :name
  attr_accessor :type

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
      @trains.push(train)
  end

  def delete_train(train)
    @trains.delete(train)
  end


#do not work
  def trains_by_type(type) 
    @trains.inject(0) do |result, train|
      if train.type == type
        result +=1
      end
    end
  end

=begin
  def trains_by_type(type) 
      self.trains.each do |train|
        if train.type == type
          puts train
        end
      end
  end
=end

  def show_trains
    @trains.each do |train| 
      puts train
    end
  end
end


class Route

  attr_reader :first_station
  attr_reader :last_station
  attr_accessor :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = []
    @stations.push(first_station)
    @stations.push(last_station)
  end
  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete_if{|index| index == station}
  end

  def show_route
    @stations.each{|station| puts station.name}
  end
end
