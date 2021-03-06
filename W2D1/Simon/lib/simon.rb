class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "What was the sequence? Ex.: 'red,blue,red,blue'"
    user_guess = gets.chomp.split(",")
    @game_over = true unless user_guess == seq
  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "Success! You've completed this round."
  end

  def game_over_message
    puts "Game over."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
