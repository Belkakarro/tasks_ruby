module SupportText

	 def split
		puts "----------"
	end

	def menu_type_train
		puts "Выберите тип поезда:"
		puts "1 - пассажирский поезд"
		puts "2 - грузовой поезд"
	end

	 def menu_type_wagon
			puts "Какой создаем вагон?"
			puts "1 - пассажирский вaгон"
			puts "2 - грузовой вaгон"
	end

	def questions_show_menu
		puts "1 - управление станциями"
		puts "2 - управление поездами"
		puts "0 - выйти из программы"
	end

	def questions_station_menu
		puts "Меню управления станциями."
		puts "1 - создать станцию"
		puts "2 - показать список станции"
		puts "3 - показать список поездов на станции"
		puts "4 - выйти в корневое меню"
	end

	def questions_train_menu
		 puts "Меню управления поeздами."
		puts "1 - создать поезд"
		puts "2 - управление вагонами"
		puts "3 - поместить поезд на станцию"
		puts "4 - выйти в корневое меню"
	end

	def questions_wagon_menu
		puts "Меню управления вагонами:"
		puts "1 - создать вагон"
		puts "2 - добавить вагон к поезду"
		puts "3 - удалить вагоны у поезда"
		puts "4 - подняться в корневое меню"
	end

	MISTAKE_IN_MENU = " # Вы ввели не корректные данные. Сделайте выбор:"
	STATIONS_LIST = " # Список станций:"
	TRAINS_LIST = " # Список поездов:"
	WAGONS_LIST = " # Выберите вагон:"
	INPUT_TRAIN_NAME = " # Введите название(номер) поезда:"
	INPUT_STATION_NAME = " # Введите название станции:"
	INPUT_WAGON_NAME = " # Введите номер вагона:"
	SELECT_STATION = " # Выберите станцию, чтобы просмотреть какие есть на ней поезда."
	#EMPTY_VARIABLE = " # Вы еще не создали ничего!"
	SUCCESS_ADD_WAGON = " # Вагон успешно добавлен"
	SUCCESS_DELETE_WAGON = " # Вагон успешно удален"
	SUCCESS_ADD_TRAIN = " # Поезд успешно добавлен на станцию"
	SUCCESS_DELETE_TRAIN = " # Поезд успешно добавлен на станцию"
	MESSAGE_STOPED_TRAIN = " # Сначала нужно остановить поезд"
	MESSAGE_INCOMPATIBILITY_TYPES = " # Не совместимость типов поезда и вагонов"
	MESSAGE_WAGON_REPEATS = " # Номер вагона не уникален, введите другой"
	MESSAGE_TRAIN_REPEATS = " # Такой поезд уже есть введите другое имя"
	MESSAGE_STATION_REPEATS = " # Название станции не уникально, введите другое имя"
	MESSAGE_NOT_TRAINS = " # У вас еще нет поездов на станции"
	MESSAGE_NOT_STATION = " # У вас еще нет станции"
	NOT_NAME = " # Вы не ввели имя, повторите попытку"
	NOT_SELECT = " # Вы не сделали выбор"

end