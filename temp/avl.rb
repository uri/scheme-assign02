# Binary Tree
require 'pp'

class Node
  attr_accessor :value, :left, :right
  def initialize(value=nil, left=nil, right=nil)
    @value = value
    @left = left
    @right = right

    @length = left.length if left != nil
    @length += right.length if right != nil
    @depth = 0
  end

  def length
    @length
  end

  def depth
    left_depth = 0
    right_depth = 0
    if @left
      left_depth = @left.depth
    end
    if @right
      right_depth = @right.depth
    end
    @depth = [left_depth, right_depth].max+1
  end

  def left
    @left
  end

  def right
    @right
  end

  def set_children(left, right)
    @left = left
    @right = right
  end

  def rotate_left
    @value, @right.value = @right.value, @value
    old_left = @left
    set_children(@right, @right.right)
    @left.set_children(old_left, @left.left)
  end

  def rotate_right
    @value, @left.value = @left.value, @value
    old_right = @right
    set_children(@left.left, @left)
    @right.set_children(@right.right, old_right)
  end

  def rotate_left_right
    @left.rotate_left
    rotate_right
  end

  def rotate_right_left
    @right.rotate_right
    rotate_left
  end

  def add(value)
    if value  @value
      # insert right
      if @right.nil?
        @right = Node.new(value)
      else
        @right.add(value)
      end
      
    end
    balance_nodes
  end

  def balance
    left_depth = 0
    right_depth = 0
    if @left
      left_depth = @left.depth
    end
    if @right
      right_depth = @right.depth
    end
    return left_depth - right_depth
  end

  def balance_nodes
    current_balance = balance
    #puts "current_balance : " + current_balance.to_s
    if current_balance > 1
      if @left.balance > 0
        rotate_right
      else
        rotate_left_right
      end
    elsif current_balance < -1
      if @right.balance < 0
        rotate_left
      else
        rotate_right_left
      end
    end
  end

  def traverse(indent=0)
    puts " " * indent + value.to_s
    if @left
      @left.traverse(indent + 2)
    end
    if @right
      @right.traverse(indent + 2)
    end
  end

end

myTree = Node.new(3)
#items = (2..10)
#items = [17, 9, 14, 23, 12, 19, 76, 54, 72, 67]
items = [5, 4]

#items.each {|x| myTree.add(rand(x * 10))}
items.each{|x| myTree.add(x)}

#pp myTree
puts
myTree.traverse
puts