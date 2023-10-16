require './player'

class Game
  attr_accessor :player1, :player2

  def initialize (player1, player2)
    @turn = 0
    self.player1 = player1
    self.player2 = player2
  end

  def start ()
    puts "Welcome, #{self.player1.name}, #{self.player2.name}, to our Two-O-Math game"
    play_game;
  end
  
  def wrong_answer(player)
    puts "Seriously? No!"
    player.lose_life
  end

  def correct_answer()
    puts "YES! Correct answer"
  end

  def display_result()
    puts "#{self.player1.show_remaining_lives} VS #{self.player2.show_remaining_lives}"
  end


  def game_over? ()
    puts "\n"
    if player1.life == 0
      puts "Player 2 #{self.player2.name} wins with a score of #{self.player2.life}/3"
      puts "------ GAME OVER ------"
      puts "Good Bye"
      true
      # exit(0)
    elsif player2.life == 0
      puts "Player 1 #{self.player1.name} wins with a score of #{self.player1.life}/3"
      puts "------ GAME OVER ------"
      puts "Good Bye"
      true
      # exit(0)
    else
      @turn += 1
      false
    end
  end

  def get_user_number ()
    while true  
      begin
        int_input = Integer(gets.chomp)
        # if input is a valid number
        return int_input
        # catches the error, prompts the error message and another try
      rescue ArgumentError
        puts "Invalid Input. Please enter a valid integer"
      end
    end
  end

  def play_game ()
    # while player1.life > 0 && player2.life > 0
    until game_over?
      num1 = rand(1..20)
      num2 = rand(1..20)
      result = num1 + num2
      # puts "\n"
      puts "----- NEW TURN -----"
      if @turn % 2 == 1
        # Player 1's turn
        puts "Player 1 #{self.player1.name}: What does #{num1} + #{num2} equal?"
        answer = get_user_number
        # make sure it's an integer??
        if answer != result
          wrong_answer(player1)
        else
          correct_answer()
        end
      else 
        # player's 2 turn
        puts "Player 2 #{self.player2.name}: What does #{num1} + #{num2} equal?"
        answer = gets.chomp.to_i
        # make sure it's an integer??
        if answer != result
          wrong_answer(player2)
        else
          correct_answer()
        end
      end
      display_result
    end
    # If game is over exit
    exit(0)
  end

end

game = Game.new(@player1, @player2)
game.start