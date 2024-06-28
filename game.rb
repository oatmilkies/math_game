require './player'
require './round'

#generate a random number between 1 and 20
def random_num
  rand(1..20)
end

#Ask the math question
def question(player)
  x = random_num
  y = random_num

  puts "#{player.name}: What does #{x} plus #{y} equal?"

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

#Print which player is the winner
def print_winner(player1, player2)
  if player1.lives > 0
    puts "#{player1.name} wins with a score of #{player1.lives}/3"
  else
    puts "#{player2.name} wins with a score of #{player2.lives}/3"
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

  puts "Game over!!"
  print_winner(player1, player2)

end