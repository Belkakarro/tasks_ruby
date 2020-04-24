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
			puts MISTAKE_IN_MENU
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
				puts MISTAKE_IN_MENU
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
				puts MISTAKE_IN_MENU
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
				puts MISTAKE_IN_MENU
				wagon_menu
			end
		end
	end

	#Работа с меню поездов
	def create_train
			puts INPUT_TRAIN_NAME
			name = gets.chomp.to_s

		if train_name_repeat?(name)
			puts MESSAGE_TRAIN_REPEATS
		elsif name.empty?
			puts NOT_NAME
			create_train
		else
				menu_type_train
				answer = gets.chomp.to_s
					if answer.empty?
							puts NOT_SELECT
					elsif answer == "1" 
						@trains << PassagerTrain.new(name)
						puts "Поезд #{name} успешно создан"
					elsif answer =="2" 
						@trains << CargoTrain.new(name)
						puts "Поезд #{name} успешно создан"
					else
						puts "вы ввели фигню"
					end
		end
		p @trains
	end
	
	def add_train_on_station
		if @stations.empty?
			puts MESSAGE_NOT_STATION 
		elsif @trains.empty?
			puts MESSAGE_NOT_TRAINS
		else
			puts STATIONS_LIST
			station = select_station

			puts TRAINS_LIST
			show_list(@trains)
			train = select_from_list(@trains)

			station.add_train(train)
		end
	end

	#Работа с меню вагонов
	def create_wagon
			puts INPUT_WAGON_NAME
			number = gets.chomp.to_s
		if wagon_name_repeat?(number)
			puts MESSAGE_WAGON_REPEATS
		elsif number.empty?
			puts NOT_NAME
			create_wagon
		else
			menu_type_train
			answer = gets.chomp.to_s
			if answer.empty?
				puts NOT_SELECT
			elsif answer == "1" 
				@wagons << PassagerWagon.new(number)
				puts "Поезд #{number} успешно создан"
			elsif answer =="2" 
				@wagons << CargoWagon.new(number)
				puts "Поезд #{number} успешно создан"
			else
				puts "вы ввели фигню"
			end
		end
	end

#return new_method_name if @trains.empty? || @wagons.empty?

	def checking_arrs
		if @trains.empty? && @wagons.empty?
			puts "У вас еще не созданы вагоны и поезда"
		elsif @trains.empty?
			puts "У вас еще не созданы поезда"
		elsif @wagons.empty?
			puts "У вас еще не созданы вагоны"
		end
	end
#return checking_arrs if @trains.empty? || @trains.wagons.empty?
	def add_wagon_train
		if @trains.empty? || @wagons.empty?
			checking_arrs 
		else
			#Выберите тип поезда
			train = select_train
			#Выбираем вагон
			wagon = select_wagon

			train.add_wagon(wagon)
			#показываем колличесвто вагон в поезде
			count_wagon_in_train(train)
		 end
	end

	def delete_wagon_train
		if @trains.empty?
			puts "У вас еще нет созданных поездов"
		else
			#Выберите тип поезда
			train = select_train
			puts "no wagons" if train.wagons.empty?
			#Выбираем вагон
			wagons_of_train = train.show_wagons_train
			#train.wagons.each_with_index{|wagon, index| puts "#{index} - соответствует #{wagon.name}"}
			wagon = select_from_list(wagons_of_train)
			

			train.delete_wagon(wagon)
			#показываем колличество вагон в поезде
			count_wagon_in_train(train)
		end
	end

	#Работа с меню станций
	def create_station
			puts INPUT_STATION_NAME
			name = gets.chomp.to_s
		if station_name_repeat?(name)
			puts MESSAGE_STATION_REPEATS
		else
			s = RailwayStation.new(name)
			@stations.push(s) 
			puts "Успешно создана станция #{name}"
		end
	end

#Показываем все созданные станции
	def show_all_stations
		if arr_empty?(@stations)
			puts MESSAGE_NOT_STATION
		else
			@stations.each{|station| puts "Станция: #{station.name}"}
		end
	end

	def show_trains_on_station
		if arr_empty?(@stations)
			puts MESSAGE_NOT_STATION
		elsif arr_empty?(@trains)
			puts MESSAGE_NOT_TRAINS
			train_menu
		else
			puts SELECT_STATION
			station = select_station
			puts "На станции  #{station.name} находятся следующие поезда:"
			station.trains.each{|train| puts "#{train.name}"}
		end
	end

	private

		def train_name_repeat?(name)
		@trains.find{|train| train.name == name}
	end

	def station_name_repeat?(name)
		@stations.find{|station| station.name == name}
	end

	def wagon_name_repeat?(name)
		@wagons.find{|wagon| wagon.name == name}
	end

	def arr_empty?(arr)
		 arr.empty?
	end

	def count_wagon_in_train(train)
		count = train.size_train
			puts "В поезде #{train.name} #{count} вагонов"
	end

	def show_list(arr)
		arr.each_with_index{|value, index| puts "#{index} - соответствует #{value.name}"}
	end


	def select_from_list(arr)
		#при выборе удаляем элемент(вагон) из общего массива
		puts "Введите порядковый номер:"
		number = gets.chomp.to_i
				arr[number]
	end

		def select_from_wagon
		#при выборе удаляем элемент(вагон) из общего массива
		puts "Введите порядковый номер:"
		number = gets.chomp.to_i
				@wagons.delete_at(number)
	end

	def show_all_wagons
		puts "Показываем все вагоны"
		@wagons.each_with_index{|wagon, index| puts "#{index} -соответствует вагону №  #{wagon.name} -  типа #{wagon.type_wagon}"}
	end

	def select_wagon
			show_all_wagons
			select_from_wagon
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
		 puts "Показываем поезда типа #{type}"
		 arr #возврат массива уже отсортированного
	end

	def show_train(arr)
		arr.each_with_index{|train, index| puts "#{index} - соответствует поезду № #{train.name}"}
	end

	def select_train
		menu_type_train
		answer = gets.chomp.to_i
			if answer.nil?
				puts NOT_SELECT
			elsif answer == 1 then type = "passager"
				sort_train = show_train(sort_train_by_type(type))
				select_from_list(sort_train)
			elsif answer == 2 then type = "cargo"
				sort_train = show_train(sort_train_by_type(type))
				select_from_list(sort_train)
			else
					puts MISTAKE_IN_MENU
					wagon_menu
			end
	end
end

menu = Menu.new
menu.start
