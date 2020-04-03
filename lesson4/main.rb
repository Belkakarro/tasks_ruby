require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'car'
require_relative 'cargo_car'
require_relative 'passager_car'
require_relative 'cargo_train'
require_relative 'passager_train'

s1 = RailwayStation.new("Simf")
s2 = RailwayStation.new("Moscow")
s3 = RailwayStation.new("Kerch")
s4 = RailwayStation.new("Yalta")

p "Созданы станции: #{s1}, #{s2}, #{s3}, #{s4}"

tp1 = PassagerTrain.new(13)
tc1 = CargoTrain.new(33)

p "Созданы поезда: #{tp1}, #{tc1}"

#Создаем вагоны
cc1 = CargoCar.new(1)
cc2 = CargoCar.new(2)
pc1 = PassagerCar.new(3)

#добавляем вагон
tc1.add_car(cc1)
puts "Добавлен вагон #{cc1} к поезду #{tc1}"

#Смотрим длину поезда
size_tc = tc1.size_train
puts "В поезде #{tc1} #{size_tc} вагонов"

#добавляем вагон не того типа 
p tc1.add_car(pc1)

#удаляем вагон
tc1.delete_car(cc1)
puts "Удален вагон #{cc1} от поезда #{tc1}"

#Смотрим длину поезда
new_size = tc1.size_train
puts "Теперь в поезде #{tc1} #{new_size} вагонов"

#Помещаем поезд на станцию
s1.add_train(tc1)
s1.add_train(tp1)
puts "Поезд #{tc1} помещен на станцию #{s1}"
puts "Поезд #{tp1} помещен на станцию #{s1}"

#Просматриваем список поездов на станции
s1_trains = s1.show_trains
puts "На станции #{s1} находятся поезда #{s1_trains}"


r1 = Route.new(s1, s2)
r1.add_station(s3)
r1.add_station(s4)
tp1.get_route(r1)
#Просматриваем список станций у поезда в маршруте
tp1_stations = tp1.show_stations
puts "У поезда #{tp1} следующий перечень станций в маршруте: #{tp1_stations}"



=begin

puts "Начинаем создание станции. Чтобы завершить введите слово 'стоп'"
stations = []
loop do
puts "Введите название станции"
name_station = gets.chomp.to_s
break if name_station == "стоп"
s = RailwayStation.new(name_station)
stations << s
end
p "Всего создано #{stations.size} станций"

loop do
		puts "Начинаем создание поездов. для выхода введите 'стоп'. Вы хотите создавать грузовые или пассажирские поезда?"
		answer_train = gets.chomp.to_s
		break if answer_train == "стоп"

			if answer_train == "грузовые"
					"Чтобы завершить введите слово 'стоп'"
					cargo_trains = []
					loop do
					puts "Введите колличество вагонов поезда:"
					cargo = gets.chomp
					break if cargo.to_s == "стоп"
					t = Train.new(cargo.to_i)
					cargo_trains << t
					end
					p "Всего создано #{cargo_trains.size} грузовых поезда"
			elsif answer_train == "пассажирские"
					"Чтобы завершить введите слово 'стоп'"
					passager_trains = []
					loop do
					puts "Введите колличество вагонов поезда:"
					passager = gets.chomp
					break if passager.to_s == "стоп"
					t = Train.new(passager.to_i)
					passager_trains << t
					end
					p "Всего создано #{passager_trains.size} пассажирских поезда"
				else 
					puts "Вы ввели что-то не то. Нужно ввести 'грузовые' или 'пассажирские'"
				end
end

=end