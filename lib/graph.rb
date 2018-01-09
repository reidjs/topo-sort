class Vertex
  attr_accessor :value, :in_edges, :out_edges
  def initialize(value)
    @value = value 
    @in_edges = []
    @out_edges = []
  end

  def remove_edge(edge) 
    in_edges.delete(edge)
    out_edges.delete(edge)
  end 
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    from_vertex.out_edges << self
    @to_vertex = to_vertex
    to_vertex.in_edges << self
    @cost = cost 
  end

  def destroy!
    from_vertex.remove_edge(self)
    to_vertex.remove_edge(self)
    @from_vertex = nil 
    @to_vertex = nil 
  end
end
