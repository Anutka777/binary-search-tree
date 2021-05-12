# frozen_string_literal: true

# Balanced binary tree
class Tree
  def initialize(array)
    @start = array[0]
    @end = array[-1]
    @mid = (@start + @end) / 2
    @root = build_tree
  end

  def build_tree
  end
end
