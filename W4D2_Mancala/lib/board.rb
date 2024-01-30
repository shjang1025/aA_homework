require_relative "./player.rb"
class Board
  attr_accessor :cups
  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
    @player_1 = Player.new(name1, 1)
    @player_2 = Player.new(name2, 2)

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times {cup << :stone}
    end
  end

  def valid_move?(start_pos)
    # return [] if start_pos == 0
    if @cups[start_pos].nil?
      raise "Invalid starting cup"
    else @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
   #side 2 #    12 11 10 9 8 7
           # 13                6
   #side 1 #    0 1  2  3  4  5 
    stones = []
    until @cups[start_pos].empty?
      stones << @cups[start_pos].shift 
    end

    i = start_pos
    until stones.empty?
      new_pos = i + 1

      if new_pos > 13
        new_pos = new_pos%13 - 1
      end

      if current_player_name == @player_1.name
        @cups[new_pos] << stones.shift unless new_pos == 13
      else
        @cups[new_pos] << stones.shift unless new_pos == 6
      end
      i += 1
    end

    self.render

    #after finishing the until loop, i will be defined as last index
    if i > 13
      i = i % 13 -1 
      self.next_turn(i)
    else
      self.next_turn(i)
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
        ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[7..12].all? {|num| num.empty?} || @cups[0..5].all? {|num| num.empty?}
    return false
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when -1
      @player_2.name
    when 0
      :draw
    when 1
      @player_1.name
    end
  end
end