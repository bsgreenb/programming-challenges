class ConnectFour
  PLAYER_ONE = 'R'
  PLAYER_TWO = 'B'

  def initialize
    @board = Array.new(6) {Array.new(7)}
    @winner = nil # false will indicate a draw

    @current_player = PLAYER_ONE
  end


  def valid_move?(col)
    return (0..6).include?(col) && @board[0][col].nil?
  end

  def get_move_row(col)
    row = 5
    until row == 0
      break if @board[row][col].nil?
      row = row - 1
    end

    return row
  end

  def declare_winner
    @winner = @current_player
    puts "Winner is " + @current_player
  end

  # Update @winner to either a player or false as appropriate.
  # Then communicate the game result
  def update_outcome(move_row, move_col)

    # Check for downward vertical winner
    if move_row <= 2
      wins = true
      for i in (1..3) do
        if @board[move_row + i][move_col] != @current_player
          wins = false
          break
        end
      end

      return declare_winner if wins
    end

    # Check for horizontal winner based on sum to left and right
    # Sum to left..
    total_horiz = 1
    other_col = move_col - 1
    while (other_col >= 0 )
      break if @board[move_row][other_col].nil?
      if @board[move_row][other_col] == @current_player
        total_horiz += 1
        other_col = other_col - 1
      else
        break
      end
    end

    return declare_winner if total_horiz >= 4

    # Sum to right
    other_col = move_col + 1
    while other_col <= 6
      if @board[move_row][other_col] == @current_player
        total_horiz += 1
        other_col += 1
      else
        break
      end
    end

    return declare_winner if total_horiz >= 4

    #TODO: diagonal

    if @board.flatten.compact == @board.flatten
      @winner = false
      puts "It's a Draw."
    end
  end

  def toggle_player
    if @current_player == PLAYER_ONE
      @current_player = PLAYER_TWO
    else
      @current_player = PLAYER_ONE
    end
  end

  def print_board
    @board.each do |board_row|
      board_row = board_row.map{|el| el.nil? ? '-' : el }
      puts board_row.join(' ') + "\n"
    end

    puts "Current player: " + @current_player
  end

  def move(col)
    return 'Game is over' unless @winner.nil?

    if valid_move?(col)
      row = get_move_row(col)

      @board[row][col] = @current_player

      print_board
      update_outcome(row, col)

      if @winner.nil? # The game is still ongoing
        toggle_player
      end
    else
      puts 'Invalid move'
    end
  end
end


cf = ConnectFour.new
cf.move(0)
cf.move(1)
cf.move(0)
cf.move(3)
cf.move(0)
cf.move(4)
cf.move(0)
