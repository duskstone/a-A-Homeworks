class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]    
    @cups[start_pos] = []

    i = start_pos
    until stones.empty?
      i += 1
      i %= 14

      if i == 6
        @cups[i] << stones.shift if current_player_name == @name1
      elsif i == 13
        @cups[i] << stones.shift if current_player_name == @name2
      else
        @cups[i] << stones.shift
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # if ending_cup_idx == 6 || ending_cup_idx == 13
    #   :prompt
    # elsif @cups[ending_cup_idx].length == 1
    #   :switch
    # else
      ending_cup_idx
    # end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i| @cups[i].empty? } || (7..12).all? { |i| @cups[i].empty? }
  end

  def winner
    player1_score = @cups[6].length
    player2_score = @cups[13].length

    if player1_score == player2_score
      :draw
    elsif player1_score > player2_score
      @name1
    else
      @name2
    end
  end
end
