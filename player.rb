class Player

  def initialize(lives, name)
    @lives = lives
    @name = name
  end

  attr_reader :lives, :name
  attr_writer :lives, :name

end