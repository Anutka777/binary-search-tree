# frozen_string_literal: true

# Single node with data and 2 children
class Node
  include Comparable
  attr_accessor :data, :left_child, :right_child

  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end

  def <=>(other)
    data <=> other.data
  end
end
