#Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

#generate a random number between 1 and 20
def random_num
  rand(1..20)
end

#Ask question
def question(player)
  x = random_num
  y = random_num

  puts "What does #{x} plus #{y} equal?"

  print "> "
  answer = $stdin.gets.chomp.to_i

  if x + y == answer
    puts "YES! You are correct"
  else
    puts "Seriously? No!"
    player.lives = player.lives - 1
  end
end

#Print each player's score
def print_scores(player1, player2)
  puts "P1: #{player1.lives} vs P2: #{player2.lives}"
end

class Player

  def initialize(lives)
    @lives = lives
  end

  attr_reader :lives
  attr_writer :lives

end


class Round
  def initialize(current_player)
    @current_player = current_player
  end

  attr_reader :current_player
  attr_writer :current_player

  def switch_player(current_player)
    if current_player == player1
      player = player2
    end
    puts current_player
  
    return current_player
  end

end



class Game

  player1 = Player.new(3)
  player2 = Player.new(3)

  round = Round.new(player1)

  while player1.lives > 0 || player2.lives > 0
    question(round.current_player)
    print_scores(player1, player2)
    round.switch_player(round.current_player)
  end

end

new_game = Game.new

new_game