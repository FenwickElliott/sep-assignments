require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @base_array = Array.new(size, LinkedList.new)
  end

  def []=(key, value)
    @base_array[key.sum % @base_array.length].add_to_tail(Node.new(key, value))
    # bucket = @base_array[key.sum % @base_array.length]
    # bucket.add_to_tail(Node.new(key, value))
  end

  def [](key)
    bucket = @base_array[key.sum % @base_array.length]
    return bucket.find(key).value if bucket.find(key)
    "Not found"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    index = key.sum % @base_array.size
  end

  # Calculate the current load factor
  def load_factor
    self.size.to_f / @base_array.length
  end

  # Simple method to return the number of items in the hash
  def size
    count = 0
    for i in 0..@base_array.length
      if @base_array[i]
        count += 1
      end
    end
    count
  end

  # Resize the hash
  def resize
    old = @base_array
    @base_array = Array.new(self.size*2)
    for i in 0..old.length
      if old[i] 
        @base_array[ old[i][0].sum % @base_array.length ] = [old[i][0], old[i][1]]
      end
    end 
  end
end
