class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    # repeat until a condition becomes true
    until @game_over
      self.take_turn
    end
    
    self.game_over_message
    self.reset_game
    
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    #things to be done if the condition is false
    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end
    
  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      puts color
    end
  end

  def require_sequence
    @seq.each do |color|
      user_input = gets.chomp
      if user_input != color
        @game_over = true
        break
      end
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Success!"
  end

  def game_over_message
    puts "Game Over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end