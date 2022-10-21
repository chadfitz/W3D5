class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = Array.new
    end

    def parent=(node)
        if @parent == nil
            if node == nil
                return @parent = nil
            else
                @parent = node
                @parent.children << self if !@parent.children.include?(self)
                return
            end
        else
            if node == nil
                return @parent = nil
            else
                old_parent = @parent
                old_parent.children.delete(self)
                @parent = node
                @parent.children << self if !@parent.children.include?(self)
                return
            end
        end
    end

    def add_child(child_node)
        self.children << child_node
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "node is a child" if !self.children.include?(child_node)
        self.children.delete(child_node)
        child_node.parent = nil
    end

    def inspect
        { 'value' => @value, 'parent_value' => @parent.value }.inspect
        # { 'value' => @value }.inspect
    end
end


# parent node p1, p2
# child node c (current)

# case 1: c.parent = nil
    # subcase 1: node given is nil
    # subcase 2: node given is not nil

# case 2: c.parent is not nil
