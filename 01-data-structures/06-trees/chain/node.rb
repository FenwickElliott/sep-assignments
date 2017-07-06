class Node
    attr_accessor :name, :rating
    attr_accessor :up, :down

    def initialize(name, rating)
        @name = name
        @rating = rating
    end
end