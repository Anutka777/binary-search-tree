# frozen_string_literal: true

require_relative 'node'

# Balanced binary tree
class Tree
  attr_accessor :root, :array

  # Building a tree
  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    if array.empty?
      nil
    else
      mid = array.length / 2
      root = Node.new(array[mid])
      root.left_child = build_tree(array[0...mid])
      root.right_child = build_tree(array[mid + 1..-1])
    end
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  def insert(value, pointer = root)
    if pointer.nil?
      pointer = Node.new(value)
    elsif value < pointer.data
      pointer.left_child = insert(value, pointer.left_child)
    elsif value > pointer.data
      pointer.right_child = insert(value, pointer.right_child)
    end
    pointer
  end

  def delete(value, pointer = root)
    return p 'No such value' unless level_order.include?(value)

    if value < pointer.data
      pointer.left_child = delete(value, pointer.left_child)
    elsif value > pointer.data
      pointer.right_child = delete(value, pointer.right_child)
    elsif pointer.data == value
      if pointer.left_child.nil?
        pointer = pointer.right_child
      elsif pointer.right_child.nil?
        pointer = pointer.left_child
      else
        leftmost_leaf = find_leftmost_leaf(pointer)
        pointer.data = leftmost_leaf.data
        if pointer.left_child == leftmost_leaf
          pointer.left_child = nil
        else
          delete(leftmost_leaf.data, pointer.left_child)
        end
      end
    end
    pointer
  end

  def find(value, pointer = root)
    return p 'No such value in the tree' if pointer.nil?

    if value < pointer.data
      find(value, pointer.left_child)
    elsif value > pointer.data
      find(value, pointer.right_child)
    elsif value == pointer.data
      pointer
    end
  end

  # Array of values breadth-first order
  def level_order(array_of_values = [], queue = [], pointer = root)
    return if pointer.nil?

    queue << pointer
    until queue.empty?
      pointer = queue.shift
      array_of_values << pointer.data
      queue << pointer.left_child unless pointer.left_child.nil?
      queue << pointer.right_child unless pointer.right_child.nil?
    end
    array_of_values
  end

  # Array of values depth-first order left-root-right
  def inorder(array_of_values = [], pointer = root)
    return array_of_values if pointer.nil?

    inorder(array_of_values, pointer.left_child)
    array_of_values << pointer.data
    inorder(array_of_values, pointer.right_child)
  end

  # Array of values depth-first order left->right bottom->top
  def postorder(array_of_values = [], pointer = root)
    return array_of_values if pointer.nil?

    postorder(array_of_values, pointer.left_child)
    postorder(array_of_values, pointer.right_child)
    array_of_values << pointer.data
  end

  # Array of values dept-first order top->bottom lef->right
  def preorder(array_of_values = [], pointer = root)
    return array_of_values if pointer.nil?

    array_of_values << pointer.data
    preorder(array_of_values, pointer.left_child)
    preorder(array_of_values, pointer.right_child)
  end

  # Iteratively
  # def height(node)
  #   height_from_left = 0
  #   height_from_right = 0
  #   pointer = node
  #   until pointer == find_leftmost_leaf(pointer)
  #     pointer = node.left_child
  #     height_from_left += 1
  #   end
  #   pointer = node
  #   until pointer == find_rightmost_leaf(node)
  #     pointer = pointer.right_child
  #     height_from_left += 1
  #   end
  #   height_from_left >= height_from_right ? height_from_left : height_from_right
  # end

  # Recursevely
  def height(node, height = 0)
    # Height is defined as the number of edges in longest path from a given node to a leaf node
    return p 'No such node' unless level_order.include?(node.data)

    return height if node.left_child.nil? && node.right_child.nil?

    node.left_child.nil? ? height(node.right_child) + 1 : height(node.left_child) + 1
  end

  def depth(node, pointer = root, depth = 0)
    # Depth is defined as the number of edges in path from a given node to the tree's root node
    return p 'No such node' unless level_order.include?(node.data)

    return depth if pointer == node

    if pointer.data < node.data
      depth(node, pointer.right_child, depth) + 1
    elsif pointer.data > node.data
      depth(node, pointer.left_child, depth) + 1
    end
  end

  def balanced?(pointer = root)
    # The difference between heights of left subtree and right subtree of every node is not more than 1
    return true if pointer.nil?

    p height_from_left = height(pointer.left_child)
    p height_from_right = height(pointer.right_child)
    return true if (height_from_left - height_from_right).abs <= 1 &&
                   balanced?(pointer.left_child) &&
                   balanced?(pointer.right_child)

    false
  end

  private

  # Min value of the current node branch
  def find_leftmost_leaf(node)
    node = node.left_child until node.left_child.nil?
    node
  end

  def find_rightmost_leaf(node)
    node = node.right_child until node.right_child.nil?
    node
  end
end
