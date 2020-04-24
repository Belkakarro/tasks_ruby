class PassagerTrain < Train

	def initialize(name)
		 @type = 'passager'
			super
	end

	protected
	#Проверяем является wagon потомком класса PassagerWagon
	def wagon_such_train?(wagon)
			wagon.is_a?(PassagerWagon)
	end
end