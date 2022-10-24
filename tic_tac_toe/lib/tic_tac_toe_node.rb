require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      if board.won? && board.winner != evaluator
        return true 
      else
        return false
      end
    else
      if evaluator == next_mover_mark
        children.all? do |move|
          move.losing_node?(evaluator)
        end
      else
        children.any? do |move|
          move.losing_node?(evaluator)
        end
      end
    end
  end

  def winning_node?(evaluator)
    if board.over?
      if board.won? && board.winner == evaluator
        return true
      else
        return false
      end
    else
      if evaluator == next_mover_mark
        children.any? do |move|
          move.winning_node?(evaluator)
        end
      else
        children.all? do |move|
          move.winning_node?(evaluator)
        end
      end
    end
  end

  # def switch_mark
  #   next_mover_mark = next_mover_mark == :o ? :x : :o
  # end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    res = []
    next_mover = next_mover_mark == :o ? :x : :o
    (0...board.rows.length).each do |row|
      (0...board.rows.length).each do |col|
        if board.empty?([row, col])
          board_dup = board.dup
          board_dup[[row, col]] = next_mover_mark 
          # next_mover = next_mover_mark == :o ? :x : :o
          # self.switch_mark
          res << TicTacToeNode.new(board_dup, next_mover, [row,col])
        end
      end
    end
    res
  end
end
