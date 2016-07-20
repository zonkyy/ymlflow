module Ymlflow
  class Action
    attr_reader :name, :dest, :label

    def initialize(name)
      @name = name
    end

    def add_dest(dest)
      case dest
      when String
        @dest = dest
      when Hash
        @dest = dest.values.first
        @label = dest.keys.first
      end
    end
  end
end
