require './player'
require './question'

class Game
  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new("P1")
    @player2 = Player.new("P2")
    @turn_number = 1
  end

  def check_answer(question)
    player_answer = gets.chomp

    if player_answer == question.total
      puts "YES! You are correct!"
    else
      puts "Seriously?! NO!"
      decrease_life
    end
  end

  def decrease_life
    if @turn_number % 2 != 0
      player1.lose_life
    else
      player2.lose_life
    end
  end

  def score
    puts "P1 #{player1.life}/3 vs P2 #{player2.life}/3"
  end

  def switch_player
    @turn_number = @turn_number + 1
  end

  def game_over
    if player1.life == 0
      "Player 2 wins with a score of #{player2.life}/3"

      puts "----- GAME OVER -----"
      puts "Good bye!"
    elsif player2.life == 0
      "Player 1 wins with a score of #{player1.life}/3"

      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
  end

  def player_turn
    if @turn_number > 1
      puts "----- NEW TURN -----"
    end
    question = Question.new
    if @turn_number % 2 != 0
      puts "Player 1: #{question.question}"
    else
      puts "Player 2: #{question.question}"
    end

    check_answer(question)

    score

    switch_player

    game_over
  end

  def loop
    while player1.life != 0 && player2.life != 0
      player_turn
    end
  end
end