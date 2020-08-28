# Implementation of a tree class, with Depth first search
# and Breadth first search algorithms
class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if @parent == nil
            @parent = parent_node
        else
            index_of_self = @parent.children.index(self)
            @parent.children.delete_at(index_of_self)
            @parent = parent_node
        end

        if parent_node != nil
            was_found = false
            parent_node.children.each do |child|
                was_found = true if self == child
            end
            parent_node.children << self if !was_found
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            child_node.parent = nil
        else
            raise "This was not a child of the node."
        end
    end

    def dfs(target_value)
        return self if @value == target_value

        @children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end

        nil
    end

    def bfs(target_value)
        queue_array = [self]

        until queue_array.length == 0
            check_item_in_queue = queue_array.shift
            return check_item_in_queue if check_item_in_queue.value == target_value
            queue_array += check_item_in_queue.children
        end
    end

    def inspect
        { 'value' => @value, 'parent_value' => @parent }.inspect
    end
end