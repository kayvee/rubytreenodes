require 'byebug'

class PolyTreeNode
  attr_accessor :children, :value
  attr_reader :parent

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_node
    @parent.children << self unless @parent.nil?

  end

  def add_child(child_node)
    child_node.parent = self unless children.include?(child_node)
  end

  def remove_child(child)
    child.parent.nil? ? raise : child.parent = nil
    # raise "Not a child" if child.parent.nil?
    # child.parent = nil
  end

  def dfs(target_value)
    return self if value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      children.each do |child|
        queue << child
      end
    end
    false
  end

end

test1 = PolyTreeNode.new(1)
test2 = PolyTreeNode.new(2)
test1.add_child(test2)
test1.add_child(test2)

##don't include since they just return
# def parent
#   #returns the node's parent
#   @parent
# end
# def parent=(value)
#   @parent = value
# end

# def children
#   #returns an array of children of node
#
# end

# def value
#   #returns the value stored at the node
#
# end
