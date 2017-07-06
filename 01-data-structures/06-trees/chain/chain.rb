require_relative 'node'

class Chain
    attr_accessor :root, :tail

    def add(node)
        return @tail = @root = node unless @root

        c = @tail

        while node.rating < c.rating
            if c.up
                c = c.up
            else
                @root = node
                node.down = c
                c.up = @root
                return
            end
        end

        node.down = c.down
        c.down = node
        node.up = c

        @tail = node if node.up = @tail
    end

    def printf
        return puts [] unless @root
        res = [@root.name]
        c = @root
        while c.down
            c = c.down
            res << c.name
        end
        print res
        puts
    end
end