# Implementing a Stack class, Last In - First out
class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[@stack.length - 1]
    end
end

stack = Stack.new
stack.push(3)
stack.push(5)
stack.pop
p stack

# Queue class which is First In - First Out

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop
    end

    def peek
        @queue[@queue.length - 1]
    end
end

queue = Queue.new
queue.enqueue(5)
queue.enqueue(3)
queue.enqueue(2)
queue.enqueue(1)
p queue.dequeue

class Map
    def initialize
        @keys = []
        @values = []
    end

    def set(key, value)
        @keys.push(key)
        @values.push(value)
    end

    def get(key)
        (0...@keys.length).each do |i|
            if key == @keys[i]
                return values[i]
            end
        end
    end

    def delete(key)
        (0...@keys.length).each do |i|
            if key == @keys[i]
                @keys.delete_at(i)
                @values.delete_at(i)
            end
        end
    end

    def show
        (0...@keys.length).each do |i|
            puts @keys[i].to_s + ", " + @values[i].to_s
        end
    end
end

map = Map.new
map.set("a", 1)
map.set("b", 2)
map.set("c", 3)
map.show
