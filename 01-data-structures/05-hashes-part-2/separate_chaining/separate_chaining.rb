require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    # index = key.sum % @items.size
    index = self.index(key, value)
    if @items[index]
      if @items[index][1] != value
        # self.resize
      end
    end
    @items[key.sum % @items.size] = [key,value]
  end

  def [](key)
    if @items[key.sum % @items.size]
      @items[key.sum % @items.size][1]
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    index = key.sum % @items.size
  end

  # Calculate the current load factor
  def load_factor
    self.size.to_f / @items.length
  end

  # Simple method to return the number of items in the hash
  def size
    count = 0
    for i in 0..@items.size
      if @items[i]
        count += 1
      end
    end
    count
  end

  # Resize the hash
  def resize
    old = @items
    @items = Array.new(self.size*2)
    for i in 0..old.length
      if old[i] 
        @items[ old[i][0].sum % @items.length ] = [old[i][0], old[i][1]]
      end
    end 
  end
end
