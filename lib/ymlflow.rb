require "yaml"
require "ymlflow/version"
require "ymlflow/graph"
require "ymlflow/node"
require "ymlflow/action"
require "ymlflow/edge"

module Ymlflow
  def self.parse(file)
    yml = YAML.load_file(file)
    graph = Graph.new(yml)
    graph
  end
end
