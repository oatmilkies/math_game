#Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

p1_lives = 3
p2_lives = 3

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

class Player

  def initialize(lives)
    @lives = lives
  end

  attr_reader :lives
  attr_writer :lives

end

player1 = Player.new(3)
player2 = Player.new(3)


question(player1)

puts "P1: #{player1.lives} vs P2: #{player2.lives}"