require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms
class Queue2 
  def initialize 
    @store = []
  end 

  def enqueue(value)
    @store << value 
  end 

  def dequeue
    @store.shift
  end 

  def length 
    @store.length 
  end 

  def empty?
    length == 0
  end 
end 


def topological_sort(vertices)
  # Determine the in-degree of each node.
  # vertex_in_edges = {}
  # vertices.each do |vertex|
  #   vertex_in_edges[vertex] = vertex.in_edges.length
  # end 
  queue = Queue2.new 
  # Collect nodes with zero in-degree in a queue.
  vertices.each do |vertex|
    if vertex.in_count == 0 
      queue.enqueue(vertex)
      vertex.enqueued = true 
    end 
  end 
  order = []

  until queue.empty?
    u = queue.dequeue 
    order << u
    u.out_edges.each do |edge|
      edge.to_vertex.in_count -= 1
    end 
    u.in_count = -1 #so we don't double count nodes 
    vertices.each do |vertex|
      if vertex.in_count == 0 && !vertex.enqueued
        queue.enqueue(vertex) 
        vertex.enqueued = true 
      end 
    end 
    # byebug
  end 
  if order.length == vertices.length 
    return order
  else 
    return [] #a cycle occurred so not all nodes reached
  end 
  # byebug
  # Pop node u from queue,
  # remove u from the graph (depending on your implementation, this may or may not involve the destroy! method; what are the complications to destroying as we loop? What is another way we can track the number of in_edges?),
  # check if there is a new node with in-degree zero (among the neighbors of u)
  # If yes, put that node into the queue.
  # We maintain a list that records in which order the nodes are removed.
  # If the queue is empty:
  # if we removed all nodes from the graph, return the list
  # else we return an empty list that indicates that an order is not possible due to a cycle
  
end
