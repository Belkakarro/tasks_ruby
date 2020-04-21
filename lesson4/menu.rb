require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passager_wagon'
require_relative 'cargo_train'
require_relative 'passager_train'
require_relative 'support_text'

class Menu

  include SupportText
  
  def initialize
    @trains = []
    @wagons = []
    @stations = []
  end

  def start
    loop do 
      show_menu
    end
  end

  def show_menu
    split
      questions_show_menu
    split
    case gets.chomp.to_i
      when 1 then station_menu
      when 2 then train_menu
      when 0 then abort
    else
      mistake_in_menu
      show_menu
    end
  end

  def station_menu
    loop do
      split
        questions_station_menu
      split
      case gets.chomp.to_i
        when 1 then create_station
        when 2 then show_all_stations
        when 3 then show_trains_on_station
        when 4 then show_menu
      else
        mistake_in_menu
        station_menu
      end
    end
  end

  def train_menu
    loop do
      split
        questions_train_menu
      split
      case gets.chomp.to_i
        when 1 then create_train
        when 2 then wagon_menu
        when 3 then add_train_on_station
        when 4 then show_menu
      else
        mistake_in_menu
        train_menu
      end
    end
  end

  def wagon_menu
    loop do
      split
       questions_wagon_menu
      split
      case gets.chomp.to_i
        when 1 then create_wagon
        when 2 then add_wagon_train
        when 3 then delete_wagon_train
        when 4 then train_menu
      else
        mistake_in_menu
        wagon_menu
      end
    end
  end

  #Работа с меню поездов
  def create_train
	  puts INPUT_TRAIN_NAME
	  num = gets.chomp.to_s

    menu_type_train
    case gets.chomp.to_i
      when 1 then train = train = PassagerTrain.new(num)
      when 2 then train = train = CargoTrain.new(num)
    else
      mistake_in_menu
    end
    @trains << train
    puts "Поезд #{num} успешно создан"
  end
  
  def add_train_on_station
    puts STATIONS_LIST
    station = select_station

    puts TRAINS_LIST
    show_list(@trains)
    train = select_from_list(@trains)

    station.add_train(train)
  end

  #Работа с меню вагонов
  def create_wagon
    puts INPUT_WAGON_NAME
    number = gets.chomp.to_s

    menu_type_wagon
    case gets.chomp.to_i
      when 1 then wagon = PassagerWagon.new(number)
      when 2 then wagon = CargoWagon.new(number)
    else
      mistake_in_menu
    end
    @wagons << wagon
    puts "Вагон номер #{number} успешно создан."
  end

  def add_wagon_train
      #Выберите тип поезда
    train = select_train
    #Выбираем поезд
    wagon = select_wagon

    train.add_wagon(wagon)
    #показываем колличесвто вагон в поезде
    count_wagon_in_train(train)
  end

  def delete_wagon_train
 		#Выберите тип поезда
    train = select_train
		#Выбираем поезд
    wagon = select_wagon

    train.delete_wagon(wagon)
    #показываем колличесвто вагон в поезде
    count_wagon_in_train(train)
  end

  #Работа с меню станций
  def create_station
    puts INPUT_STATION_NAME
    name = gets.chomp.to_s
    s = RailwayStation.new(name)
    @stations.push(s) 
    puts "Успешно создана станция #{name}"
  end

#Показываем все созданные станции
  def show_all_stations
  	if_empty(@stations)
    @stations.each{|station| puts "Станция: #{station.name}"}
  end

  def show_trains_on_station
    puts SELECT_STATION
    station = select_station
    puts "На станции  #{station.name} находятся следующие поезда:"
    station.trains.each{|train| puts "#{train.name}"}
  end

  private

  def if_empty(arr)
		puts EMPTY_VARIABLE if arr.empty?
	end

  def count_wagon_in_train(train)
		count = train.size_train
      puts "В поезде #{train.name} #{count} вагонов"
  end

  def show_list(arr)
  	#if_empty(arr)
    arr.each_with_index{|value, index| puts "#{index} - соответствует #{value.name}"}
  end

  def show_list_wagons(arr)
  	#if_empty(arr)
    arr.each_with_index{|value, index| puts "#{index} - соответствует #{value.name} типа #{value.type_wagon}"}
  end

  def select_from_list(arr)
    puts "Введите порядковый номер:"
    number = gets.chomp.to_i
    arr[number]
  end

  def show_all_wagons
  	if_empty(@wagons)
    @wagons.each_with_index{|wagon, index| puts "#{index} -соответствует вагону №  #{wagon.name} -  типа #{wagon.type_wagon}"}
  end

  def select_wagon
      show_all_wagons
      select_from_list(@wagons)
  end

  def select_station
    show_list(@stations)
    select_from_list(@stations)
  end

  def sort_train_by_type(type)
    arr = []
    @trains.each do|train| 
       arr << train if train.type == type
     end
     puts "Показываем поезда тип #{type}"
     arr #возврат массива уже отсортированного
  end

  def show_train(arr)
    arr.each_with_index{|train, index| puts "#{index} - соответствует поезду № #{train.name}"}
  end

  def select_train
    menu_type_train
      case gets.chomp.to_i
        when 1 then type = "passager"
        when 2 then type = "cargo"
      else
        mistake_in_menu
      end
      sort_train = show_train(sort_train_by_type(type))
      select_from_list(sort_train)
  end
end

menu = Menu.new
menu.start
