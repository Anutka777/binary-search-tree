# frozen_string_literal: true

require_relative 'tree'

test_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# test_tree = Tree.new([1, 2, 3])

# test_tree.insert(50)
test_tree.insert(6)
p test_tree
test_tree.pretty_print
