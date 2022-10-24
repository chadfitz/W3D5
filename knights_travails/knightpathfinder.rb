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
  attr_reader :pos_node, :start_pos

  def initialize(start_pos)
    @start_pos = start_pos
    @pos_node = KnightPathFinder.root_node(start_pos)
    @considered_positions = [start_pos]
  end

  def new_move_positions(pos)
    all_possible_pos = KnightPathFinder.valid_moves(pos)
    new_moves = all_possible_pos.select { |possible_move| !considered_positions.include?(possible_move) }
    considered_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree
    queue = []
    queue << self.pos_node
    until queue.empty?
      # debugger
      current_pos_node = queue.shift
      all_new_moves = new_move_positions(current_pos_node.value)
      all_new_moves.each do |mp|
        p_node = PolyTreeNode.new(mp)
        current_pos_node.add_child(p_node)
        queue << p_node
      end
    end
  end

  def find_path(end_pos) 
    end_node = self.pos_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(node)
    res = [node.value]
    until node.parent.nil?
      res.unshift(node.parent.value)
      node = node.parent
    end
    res
  end
end
