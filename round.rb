class Round
  def initialize(current_player)
    @current_player = current_player
  end

  attr_reader :current_player
  attr_writer :current_player

  def switch_player(player1, player2)
    @current_player = @current_player == player1 ? player2 : player1
  end

end