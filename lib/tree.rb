# frozen_string_literal: true

require_relative 'node'

# Balanced binary tree
class Tree
  attr_accessor :root, :data

  def initialize(array)
    @root = build_tree(array.sort.uniq)
    p array.sort.uniq
  end

  def build_tree(data, start = 0, endl = data.length - 1)
    if start > endl
      nil
    else
      mid = start + (endl - start + 1) / 2
      root = Node.new(data[mid])
      root.left_child = build_tree(data, start, mid - 1)
      root.right_child = build_tree(data, mid + 1, endl)
    end
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
