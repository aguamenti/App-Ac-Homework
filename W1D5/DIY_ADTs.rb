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


class Map
  attr_reader :map_arr

  def initialize
    @map_arr = []
  end

  def set(key, value)
    key_idx = nil
    @map_arr.each_with_index do |pair, idx|
      key_idx = idx if pair.first == key
    end

    key_idx ? @map_arr[key_idx] = [key, value] : @map_arr << [key, value]
    @map_arr
  end

  def get(key)
    @map_arr.each {|pair| return pair.last if pair.first == key}
    nil
  end

  def delete(key)
    val = get(key)
    @map_arr.select! {|pair| pair.first != key}
    val
  end

  def show

  end
end
