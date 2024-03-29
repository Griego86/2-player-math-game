require_relative 'player'
require_relative 'math_question'

class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
    @math_question = MathQuestion.new
  end

  def start_game
    loop do
      current_player = @players[@current_player_index]
      puts "#{current_player.name}'s turn:"
      
      question = @math_question.generate_question
      puts question

      answer = gets.chomp

      if @math_question.check_answer(answer)
        puts "Correct!"
      else
        puts "Incorrect!"
        current_player.reduce_life
      end

      display_scores

      break if game_over?

      switch_turn
    end

    announce_winner
  end

  private

  def switch_turn
    @current_player_index = (@current_player_index + 1) % @players.length
  end

  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def display_scores
    @players.each { |player| puts "#{player.name}: #{player.lives} lives left" }
    puts "-----"
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }
    puts "#{winner.name} wins with #{winner.lives} lives remaining!"
    loser = @players.find { |player| player != winner }
    puts "#{loser.name} had #{loser.lives} lives remaining."
  end
end
