require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    t = TicTacToeNode.new(game.board, mark, prev_move_pos = nil)
    t.children.each do |c|
      if c.winning_node?(mark)
        return c.prev_move_pos 
      end
    end
    not_losing_nodes = t.children.select do |c|
      !c.losing_node?(mark)
    end
    return not_losing_nodes.first.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
