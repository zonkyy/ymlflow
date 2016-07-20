# coding: utf-8
module Ymlflow
  class Graph
    DEFAULT_SETTINGS = {
      graph: {
        charset: "UTF-8",
        labelloc: "t",
        labeljust: "r",
        style: "filled",
        rankdir: "LR",
        margin: 0.2,
        ranksep: 0.5,
        nodesep: 0.4,
      },
      node: {
        style: "solid",
        fontsize: 11,
        margin: "0.1,0.1",
        fontname: "Osaka-Mono,ＭＳ ゴシック",
      },
      edge: {
        fontsize: 9,
        fontname: "Osaka-Mono,ＭＳ ゴシック",
        color: "#777777",
      },
    }

    attr_reader :settings, :nodes, :edges

    def initialize(yml)
      @settings = DEFAULT_SETTINGS
      @nodes = []
      @edges = []
      yml.each do |k, v|
        node = Node.new(k)
        v.each do |n|
          node.add_action(n)
        end
        @nodes << node
        @edges.concat(node.edges)
      end
    end
  end
end
