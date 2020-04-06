require 'set'
class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        self.value = value
        self.neighbors = []
    end 

    def bfs(start_node, target)
        queue = [start_node]
        visited = Set.new

        until queue.empty?
            ele = queue.shift

            if visited.include?(ele)
                return nil
            else 
                return ele.value if ele.value == target_value 
                visited << ele 
                ele.neighbors.each do |neighbor| 
                    queue << neighbor 
                end 
            end 
        end 
    end 
end 

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')

a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

bfs(a, "b")
bfs(a, "f")