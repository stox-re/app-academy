# Instead of printing out entire objects, we can override with inspect

class PolyTreeNode
  # ...
  # ...
    def inspect
        @value.inspect
    end
end

class PolyTreeNode
  # ...
  # ...
    def inspect
        { 'value' => @value, 'parent_value' => @parent.value }.inspect
    end
end