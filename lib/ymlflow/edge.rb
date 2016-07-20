module Ymlflow
  class Edge
    attr_reader :from, :from_index, :dest, :label

    def initialize(from, from_index, dest, label)
      @from = from
      @from_index = from_index
      @dest = dest
      @label = label
    end

    def to_dot
      dot = %Q|  "#{@from}":action#{@from_index} -> "#{@dest}"|
      dot << %Q|[label = "#{@label}"]| if @label
      dot
    end
  end
end
