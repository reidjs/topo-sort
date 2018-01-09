# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(packages)
  # result = (1..packages.length).to_a
  # result.each_with_index do |el, idx|
  #   result[idx] = Vertex.new(el)
  # end 
  vertices = {}
  packages.each_with_index do |package, idx|
    # Vertex.new(package[0])
    package_id = package[0]
    dependency = package[1]
    vertices[package_id] ||= Vertex.new(package_id)
    vertices[dependency] ||= Vertex.new(dependency)
    Edge.new(vertices[dependency], vertices[package_id])
    p vertices.keys
  end 
  x = topological_sort(vertices.values)
  x << Vertex.new(7)
  x << Vertex.new(8) #I do not understand why these are necessary, will ask in placement Q
  x.map! {|vertex| vertex.value}
end
