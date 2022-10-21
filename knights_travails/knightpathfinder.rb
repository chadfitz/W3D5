require_relative "../skeleton/lib/00_tree_node"
require "byebug"
class KnightPathFinder

  def self.root_node(pos)
    PolyTreeNode.new(pos)
  end

  def self.valid_moves(pos)
    arr = []
    row, col = pos.value
    arr << [row+2, col+1]
    arr << [row+2, col-1]
    arr << [row+1, col-2]
    arr << [row+1, col+2]
    arr << [row-2, col+1]
    arr << [row-2, col-1]
    arr << [row-1, col+2]
    arr << [row-1, col-2]

    moves = arr.select {|r,c| r <=7 && r >= 0 && c >= 0 && c <= 7}
    moves.map {|r,c| PolyTreeNode.new([r,c])}
  end

  attr_accessor :considered_positions
  attr_reader :position

  def initialize(pos)
    @position = KnightPathFinder.root_node(pos)
    @considered_positions = [@position]
    # self.build_move_tree(self.root_node)
  end

  def new_move_positions(pos)
    all_possible_pos = KnightPathFinder.valid_moves(pos)
    # all_possible_pos.reject { |old_pos| considered_positions.include?(old_pos) }
    all_possible_pos.select { |pp| !considered_positions.include?(pp) }
  end

  def build_move_tree
    arr = []
    arr << self.position
    until arr.empty?
      debugger
      current_node = arr.shift
      considered_positions << current_node
      new_move_positions(current_node).each do |mp|
        arr << mp
      end
    end
    arr
  end
end
    # def bfs(target_value)
    #     arr = []
    #     arr.unshift(self)
    #     until arr.empty?
    #         node = arr.pop
    #         return node if node.value == target_value
    #         node.children.each {|child| arr.unshift(child)}
    #     end
    #     nil
    # end