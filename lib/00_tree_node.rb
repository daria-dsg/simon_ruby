
require "byebug"

class PolyTreeNode

    attr_reader :value, :children, :parent

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent)
        #does not add the child twice 
        return  if self.parent == parent 

        # remove node from the previous parent
        @parent.children.reject! { |child| child == self} if self.parent
        
        # reassign parent and add the node to his children
        @parent = parent
        @parent.children << self unless self.parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "This is not a child" unless child_node.parent == self
        child_node.parent = nil
    end


    def inspect
        {parent: parent,
         children: children,
         value: value}.inspect
    end

end