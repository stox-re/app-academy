def windowed_max_range(array, window_size)
  current_max_range = 0

  array.each_with_index do |num, index|
    window = array[index..index + window_size - 1]
    min = window.min
    max = window.max
    if max - min > current_max_range
      current_max_range = max - min
    end
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(ele)
    @store.push(ele)
  end

  def dequeue(ele)
    @store.shift(ele)
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end
end

def MyStack
  def initialize
    @store = []
  end

  def push(ele)
    @store << ele
  end

  def pop(ele)
    @store.pop
  end

  def peek
    @store[@store.length - 1]
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end
end

class StackQueue
  def initialize
    @queue_stack = MyStack.new
    @dequeue_stack = MyStack.new
    @current_stack = @queue_stack
  end

  def enqueue(ele)
    @current_stack = @queue_stack
    while !@dequeue_stack.empty?
      @queue_stack.push(@dequeue_stack.pop)
    end
    @queue_stack.push(ele)
  end

  def dequeue_stack
    @current_stack = @dequeue_stack
    while !@queue_stack.empty?
      @dequeue_stack.push(@queue_stack.pop)
    end
    @dequeue_stack.pop
  end

  def size
    @current_stack.size
  end

  def empty?
    @current_stack.empty?
  end
end
