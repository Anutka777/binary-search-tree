# frozen_string_literal: true

require_relative 'tree'

test_tree = Tree.new(Array.new(15) { rand(1..100) })
test_tree.pretty_print
p test_tree.balanced?

p test_tree.level_order
p test_tree.inorder
p test_tree.preorder
p test_tree.postorder

test_tree.insert(rand(1..100))
test_tree.insert(rand(1..100))
test_tree.insert(rand(1..100))
test_tree.insert(rand(1..100))
test_tree.insert(rand(1..100))
test_tree.pretty_print
p test_tree.balanced?

p test_tree.inorder
test_tree.rebalance
test_tree.pretty_print
p test_tree.balanced?
