#Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

#generate a random number between 1 and 20
def random_num
  rand(1..20)
end

#Ask the math question
def question(player)
  x = random_num
  y = random_num

  puts "What does #{x} plus #{y} equal?"

  print "> "
  answer = $stdin.gets.chomp.to_i

  if x + y == answer
    puts "YES! You are correct #{player.name}"
  else
    puts "Seriously? No! #{player.name}"
    player.lives = player.lives - 1
  end
end

#Print each player's score
def print_scores(player1, player2)
  puts "#{player1.name}: #{player1.lives} vs #{player1.name}: #{player2.lives}"
end


class Player

  def initialize(lives, name)
    @lives = lives
    @name = name
  end

  attr_reader :lives, :name
  attr_writer :lives, :name

end


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


class Game

  player1 = Player.new(3, "P1")
  player2 = Player.new(3, "P2")

  round = Round.new(player1)

  while player1.lives > 0 && player2.lives > 0
    question(round.current_player)
    print_scores(player1, player2)
    round.switch_player(player1, player2)
  end

  puts "The final scores are:"
  print_scores(player1, player2)

end

new_game = Game.new

new_game