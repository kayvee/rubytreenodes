require 'byebug'
require_relative 'PolyTreeNode'

class KnightPathFinder
  def self.valid_moves(pos)
    x, y = pos
    moves_list = []
    relative_moves = [[2, 1], [-2, 1], [2, -1], [-2, -1],
    [1, 2], [-1, 2], [-2, 1], [-2, -1]]
    relative_moves.each do |move|
      potential_move = [x + move[0], y + move[1]]
      moves_list << potential_move if KnightPathFinder.valid_move?(potential_move)
    end
    moves_list
  end

  #finds if it is valid on the broad overall
  def self.valid_move?(pos)
    x, y = pos
    return x.between?(0, 7) && y.between?(0, 7)
  end

  attr_accessor :visited_positions, :move_tree
  attr_reader :start_pos

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
    @move_tree = build_move_tree
  end

  def build_move_tree
     move_tree = PolyTreeNode.new(start_pos)
     queue = [move_tree]

    until queue.empty?
      current_node = queue.shift
      new_move_positions(current_node.value).each do |pos|
        new_node = PolyTreeNode.new(pos)
        new_node.parent = current_node
        queue << new_node
      end
    end

    move_tree
  end

  def new_move_positions(pos)
    potential_moves = KnightPathFinder.valid_moves(pos)
    p visited_positions
    new_moves = potential_moves.reject do |move|
      visited_positions.include?(move)
    end
    p new_moves
    visited_positions.concat(new_moves)
    new_moves
  end

  # def [](pos)
  #   x, y = pos
  #   # x = pos[0]
  #   # y = pos[1]
  #
  # end


  def find_path

  end
end
