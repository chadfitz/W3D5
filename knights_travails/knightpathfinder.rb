require_relative "../skeleton/lib/00_tree_node"

class KnightPathFinder

  def self.root_node(pos)
    PolyTreeNode.new(pos)
  end

  def self.valid_moves(pos)
    arr = []
    row, col = pos
    arr << [row+2, col+1]
    ...
    ..
    ..

    arr.select {|r,c| r <=7 && r >= 0}

    end
    [[],[]]
  end

  attr_accessor :considered_position

  def initialize(pos)
    @pos = KnightPathFinder.root_node(pos)
    @considered_position = [pos]
    # self.build_move_tree(self.root_node)
  end

  def new_move_positions(pos)

  end

  def build_move_tree


  end
end

# ptn = PolyTreeNode.new(3)
# print ptn
