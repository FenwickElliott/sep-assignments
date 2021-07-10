require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @base_array = Array.new(size)
  end

  def print
    @base_array.each {|b| b.each {|x| puts x.key if x} if b}
  end

  def cell_count
    count = 0
    @base_array.each {|b| b.each {|x| count += 1} if b}
    count
  end

  def print_bucket(n)
    @base_array[n].each {|node| puts node.key}
  end

  def []=(key, value)
    @base_array[key.sum % size] = LinkedList.new unless @base_array[key.sum % size]
    @base_array[key.sum % size].add_to_tail(Node.new(key, value))
    resize if load_factor > @max_load_factor
  end

  def [](key)
    @base_array[key.sum % size].each {|node| return node.value if node.key == key}
  end

  def index(key, size = self.size)
    key.sum % @base_array.size
  end

  def load_factor
    cell_count.to_f / size
  end

  def size
    @base_array.size
  end

  def resize
    old = @base_array
    @base_array = Array.new(old.length*2)
    old.each {|b| b.each do |x| 
      @base_array[x.key.sum % size] = LinkedList.new unless @base_array[x.key.sum % size]
      @base_array[x.key.sum % size].add_to_tail(Node.new(x.key, x.value))
    end if b}
  end
end