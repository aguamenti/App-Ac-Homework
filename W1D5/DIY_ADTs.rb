class Stack #LIFO
  attr_reader :stack_arr

  def initialize
    @stack_arr = []
  end

  def push(el)
    @stack_arr.push(el)
    el
  end

  def pop
    @stack_arr.pop
  end

  def peek
    @stack_arr.last
  end
end

class Queue #FIFO
  attr_reader :queue_arr

  def initialize
    @queue_arr = []
  end

  def enqueue(el)
    @queue_arr.push(el)
    el
  end

  def dequeue
    self.shift
  end

  def peek
    @queue_arr.first
  end
end
