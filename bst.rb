require 'pry'
require 'ap'


class BST
  attr_accessor :root, :count, :min, :max

  def initialize(val = nil) 
    @root = nil 
    @root = insert(val) if val
  end


  def insert(val)
    @root = rinsert(@root, val)
  end
 
  def print_all
    puts "Preorder"
    traverse(@root, :preorder) 
    puts "Inorder"
    traverse(@root, :inorder) 
    puts "Postorder"
    traverse(@root, :postorder) 
  end

  # Pre-order traversal 
  def traverse(node, order = :preorder) 
    return if node.nil?
    case order
    when :preorder
      puts node.val
      traverse(node.left, order)
      traverse(node.right, order)
    when :inorder
      traverse(node.left, order)
      puts node.val
      traverse(node.right, order)
    when :postorder
      traverse(node.left, order)
      traverse(node.right, order)
      puts node.val
    end
  end
 
  # Search 
  def search(node, val)
    if node.val == val
      return node
    elsif val < node.val 
      search(node.left, val)
    elsif node.val 
      search(node.right, val)
    end
  end

  # Recursive Insert
  def rinsert(node, val)
    if node.nil?
      node = Node.new(val)
    elsif val < node.val
      node.left = rinsert(node.left, val)
    elsif val > node.val 
      node.right = rinsert(node.right, val)
    elsif val == node.val 
      node.val = val 
    end
    node
  end

  # Delete value (node)
  def delete(node, val)
    
  end

  class Node
    attr_accessor :val, :left, :right
    def initialize(val = nil, left = nil, right = nil)
      @val, @left, @right = val, left, right
    end
  end



end

# Debug
bst = BST.new(50)

# insert 10 randoms 
nums = ""
10.times.each do 
  rand = Random.rand(100)
  bst.insert(rand)
  nums += "#{rand} "
end
# puts "Numbers inserted"
# puts nums

bst.print_all
# ap bst.root

binding.pry
