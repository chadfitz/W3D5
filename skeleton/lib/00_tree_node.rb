class PolyTreeNode
    attr_reader :parent, :children, :value
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = Array.new
    end

    def parent=(node)
        return @parent = nil if node == nil
        return  if node.children.include?(self)
        @parent = node
        node.children << self
    end

    # def parent
    #     if @parent
    #         return @parent
    #     else
    #         return nil
    #     end
    # end

    def inspect
        # { 'value' => @value, 'parent_value' => @parent.value }.inspect 
        { 'value' => @value }.inspect 
    end
end