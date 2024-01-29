class Stack
    def initialize
      # create ivar to store stack here!
      inner_array = []
    end
  
    def push(el)
      # adds an element to the stack
      inner_array.push(el)
    end
  
    def pop
      # removes one element from the stack
      inner_array.pop
    end
  
    def peek
      # returns, but doesn't remove, the top element in the stack
      inner_array.last
    end

    private
    attr_reader :inner_array
  end

  class Queue
    def initialize
        inner_array = []

    end

    def enqueue(el)
        inner_array.push(el)

    end

    def dequeue
        inner_array.shift

    end

    def peek
        inner_array.first

    end

    private
    attr_reader :inner_array
  end

class Map

    def initialize
        inner_array = []
    end
    
    def set(key, value)
        pair_index = inner_array.index { |pair| pair[0] == key }
        if pair_index
            inner_array[pair_index][1] = value
        else
            inner_array.push([key, value])
        end
        value
    end
    
    def get(key)
        inner_array.each { |pair| return pair[1] if pair[0] == key }
        nil
    end
    
    def delete(key)
        value = get(key)
        inner_array.reject! { |pair| pair[0] == key }
        value
    end
    
    def show
        deep_dup(inner_array)
    end
    
    private
    
    attr_reader :inner_array
      
    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end
end
