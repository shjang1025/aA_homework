class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val)
    @val = val
    @neighbors = []
  end


  def bfs(starting_node, target_value)
    

    visited = Set.new()
    queue = [starting_node]

    until queue.empty?
        current_node = queue.shift
        return current_node if current_node.val == target
        visited.add(node.val)

        current_node.neighbors.each do |neigbhor|
            queue.push(neighbor) if (!visited.include?(neighbor))
        end

    end
    nil


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
