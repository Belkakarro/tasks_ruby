class Train

  #attr_accessor :number_car
  attr_accessor :speed
  attr_accessor :station
  attr_accessor :route
  attr_accessor :name

  #разрешение на чтение свойства и из других классов
  attr_reader :type

  def initialize(name)
    @name = name
    @type
    @speed = 0
    @route
    @wagons = []
    @station
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

  def add_wagon(wagon)
      if !train_stopped?
        puts MESSAGE_STOPED_TRAIN
    elsif !wagon_such_train?(wagon)
     puts MESSAGE_INCOMPATIBILITY_TYPES
    elsif train_stopped? && wagon_such_train?(wagon)
     add_wagon!(wagon)
     SUCCESS_ADD_WAGON
    end
  end

  def delete_wagon(wagon)
    if !train_stopped?
        puts MESSAGE_STOPED_TRAIN
    elsif !wagon_such_train?(wagon)
     puts MESSAGE_INCOMPATIBILITY_TYPES
    elsif train_stopped? && wagon_such_train?(wagon)
     delete_wagon!
     SUCCESS_DELETE_WAGON
    end
  end 

  def get_route(route)
    @route = route
    @station = self.route.stations.first
  end

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

  def add_wagon!(wagon)
    @wagons.push(wagon)
  end

  def delete_wagon!
    @wagons.pop
  end

  def wagon_such_train?(wagon)
  end

end