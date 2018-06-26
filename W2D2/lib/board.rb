class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones #why don't need a self.cups.place_stones?
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      cup.concat([:stone, :stone, :stone, :stone])
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 12)
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []

    # if current_player_name == @name1
    #   others_cups = (7..13).to_a
    # else
    #   others_cups = (0..6).to_a
    # end

    current_idx = start_pos

    until stones.empty?
      # current_idx += 1
      # cups[current_idx] << stones.shift unless others_cups.include?(current_idx)

      current_idx += 1
      current_idx = 0 if current_idx > 13
      # places stones in the correct current player's cups
      if current_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif current_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[current_idx] << stones.pop
      end
    end

    render
    next_turn(current_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
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
    if @cups[0..5].all? {|cup| cup.empty?} || @cups[7..11].all? {|cup| cup.empty?}
      return true
    else
      return false
    end
  end

  def winner
    if cups[6].length == cups[13].length
      :draw
    elsif cups[6].length > cups[13].length
      @name1
    else
      @name2
    end
  end

end
