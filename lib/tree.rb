# frozen_string_literal: true

require_relative 'node'

# Balanced binary tree
class Tree
  attr_accessor :root, :array

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

  def insert(value, node = root)
    if node.nil?
      node = Node.new(value)
    elsif value < node.data
      node.left_child = insert(value, node.left_child)
    elsif value > node.data
      node.right_child = insert(value, node.right_child)
    end
    node
  end

  def delete(value, node = root)
    if value < node.data
      node.left_child = delete(value, node.left_child)
    elsif value > node.data
      node.right_child = delete(value, node.right_child)
    elsif node.data == value
      if node.left_child.nil?
        node = node.right_child
      elsif node.right_child.nil?
        node = node.left_child
      else
        leftmost_leaf = find_leftmost_leaf(node)
        node.data = leftmost_leaf.data
        delete(leftmost_leaf.data, node.left_child)
      end
    end
    node
  end

  private

  def find_leftmost_leaf(node)
    node = node.left_child until node.left_child.nil?
    node
  end
end
