class CargoTrain < Train

  def initialize(name)
    @type = 'cargo'
    super
  end

  protected
  def wagon_such_train?(wagon)
    wagon.is_a?(CargoWagon)
  end

end