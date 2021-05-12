# frozen_string_literal: true

require_relative 'comparable'

# Single node with data and 2 children
class Node
  include Comparable
  attr_accessor :datas, :left_child, :right_child

  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end
end

node = Node.new(5)
# p node
