require_relative "../skeleton/lib/00_tree_node"
require "byebug"
class KnightPathFinder

  def self.root_node(pos)
    PolyTreeNode.new(pos)
  end

  def self.valid_moves(pos)
    arr = []
    row, col = pos
    arr << [row+2, col+1]
    arr << [row+2, col-1]
    arr << [row+1, col-2]
    arr << [row+1, col+2]
    arr << [row-2, col+1]
    arr << [row-2, col-1]
    arr << [row-1, col+2]
    arr << [row-1, col-2]

    moves = arr.select {|r,c| r <=7 && r >= 0 && c >= 0 && c <= 7}
  end

  attr_accessor :considered_positions
  attr_reader :pos_node

  def initialize(pos)
    @pos_node = KnightPathFinder.root_node(pos)
    @considered_positions = [pos]
  end

  def new_move_positions(pos)
    all_possible_pos = KnightPathFinder.valid_moves(pos)
    # all_possible_pos.reject { |old_pos| considered_positions.include?(old_pos) }
    new_moves = all_possible_pos.select { |possible_move| !considered_positions.include?(possible_move) }
    considered_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree
    queue = []
    res = []
    queue << self.pos_node.value
    until queue.empty?
      # debugger
      current_pos = queue.shift
      all_new_moves = new_move_positions(current_pos)
      res += all_new_moves
      all_new_moves.each do |mp|
        queue << mp
      end
    end
    res.map{|move| PolyTreeNode.new(move)}
  end
end
