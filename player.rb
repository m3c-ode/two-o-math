class Player
  attr_reader :life, :name
  def initialize (name)
    @name = name
    @life = 3
  end

  def lose_life ()
    @life -= 1
    # puts "#{@name}: #{@life}/3"
  end

  def show_remaining_lives
    "#{@name}: #{@life}/3"
  end
  
end

@player1 = Player.new("P1")
@player2 = Player.new("P2")