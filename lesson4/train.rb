class Train

  #attr_accessor :number_car
  attr_accessor :speed
  attr_accessor :station
  attr_accessor :route

  #разрешение на чтение свойства и из других классов
  attr_reader :type

  def initialize(number_car)
    @type
    #@number_car = number_car
    @speed = 0
    @route
    @wagons = (1..number_car).to_a
    @station
    #@station = self.route.stations.first
  end

  def rize_speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def show_stations
      @route.stations.each do |station| 
        puts station
      end
  end

  def add_car(car)
      if !train_stopped?
        puts "Сначала нужно остановить поезд"
    elsif !car_such_train?(car)
     puts "Не совместимость типов поезда и вагонов"
    elsif train_stopped? && car_such_train?(car)
     add_car!(car)
    end
  end

  def delete_car(car)
    if !train_stopped?
        puts "Сначала нужно остановить поезд"
    elsif !car_such_train?(car)
     puts "Не совместимость типов поезда и вагонов"
    elsif train_stopped? && car_such_train?(car)
     delete_car!
    end
  end 

  def get_route(route)
    @route = route
    @station = self.route.stations.first
  end

  #def start_station
  #  @station = self.route.stations.first
  #end

  def move_next_station
    @station = self.route.stations[route.stations.index(self.station) + 1]
  end

  def previous_station
    @route.stations[route.stations.index(self.station) - 1]
  end

  def next_station
    @route.stations[route.stations.index(self.station) + 1]
  end

  def current_station
      @station
  end

  def size_train
    @wagons.size
  end
=begin
Эти методы используются внутри других методов, поэтому прямой доступ к ним не нужен
=end

  protected
  def train_stopped?
    @speed.zero?
  end

  def add_car!(car)
    @wagons.push(car)
  end

  def delete_car!
    @wagons.pop
  end

  def car_such_train?(car)
  end

end