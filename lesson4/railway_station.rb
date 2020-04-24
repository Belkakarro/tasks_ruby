require_relative 'support_text'
class RailwayStation
	include SupportText

	attr_accessor :trains
	attr_reader :name

	def initialize(name)
		@name = name
		@trains = []
	end

	def add_train(train)
			@trains.push(train)
			SUCCESS_ADD_TRAIN
	end

	def delete_train(train)
		@trains.delete(train)
		SUCCESS_DELETE_TRAIN
	end

	def trains_by_type(type) 
			cargo_train = 0
			passager_train = 0
				self.trains.each do |train|
				cargo_train +=1 if train.type == "cargo"
				passager_train +=1 if train.type == "passager"
				end
				puts "Грузовых поездов: #{cargo_train}"
				puts "Пассажирских поездов: #{passager_train}"
	end

	def show_trains
		@trains.each do |train| 
			puts train
		end
	end
end