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