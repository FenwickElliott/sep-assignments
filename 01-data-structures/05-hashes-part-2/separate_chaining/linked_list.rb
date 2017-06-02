require_relative 'node'

class LinkedList
  attr_accessor :head

  def add_to_tail(node)
    if @head
      c = @head
      if c.key == node.key
        c.value = node.value
        return
      end
      return c.value = node.value if c.key == node.key
      while c.next
        if c.key == node.key
          c.value = node.value
          return
        end
        return c.value = node.value if c.key == node.key
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

