require_relative 'node'

class OpenAddressing
  def initialize(size)
    @base_array = Array.new(size)
  end

  def []=(key, value)
    index = key.sum % size
    if @base_array[index] == nil
      @base_array[index] = [key, value]
    else
      ni = next_open_index(index)
      if ni == -1
        resize
        self.[]=(key,value)
      else
        @base_array[ni] = [key,value]
      end
    end
  end

  def [](key)
    i = key.sum % size
    size.times do
      return @base_array[i][1] if @base_array[i][0] && @base_array[i][0] == key
      i+= 1
      i = 0 if i == size
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    ni = index
    while @base_array[ni] != nil
      ni += 1
      ni = 0 if ni == @base_array.length
      return -1 if ni == index
    end
    ni
  end

  # Simple method to return the number of items in the hash
  def size
    @base_array.length
  end

  # Resize the hash
  def resize
    old = @base_array
    @base_array = Array.new(old.length*2)
    old.each {|c| self.[]=(c[0],c[1]) if c}
  end

end