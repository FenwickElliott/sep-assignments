require_relative 'node'

class LinkedList
  attr_accessor :head

  def add_to_tail(node)
    if @head
      c = @head
      while c.next
        c = c.next
      end
      c.next = node
    else
      @head = node
    end
  end

  def each
    p = @head
    while p
      yield p
      p = p.next
    end
  end
end

