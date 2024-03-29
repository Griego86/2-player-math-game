class Player
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 3 # Starting lives for each player
  end

  def reduce_life
    @lives -= 1
  end
end
