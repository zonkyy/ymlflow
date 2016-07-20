module Ymlflow
  class Node
    SHAPE = 'record'
    attr_reader :name, :shape, :actions

    def initialize(name)
      @name = name
      @shape = SHAPE
      @actions = []
    end

    def add_action(action)
      case action
      when String
        @actions << Action.new(action)
      when Hash
        action.each do |name, dest|
          a = Action.new(name)
          a.add_dest(dest)
          @actions << a
        end
      end
    end

    def edges
      ret = []
      @actions.each_with_index do |action, idx|
        next unless action.dest
        ret << Edge.new(@name, idx, action.dest, action.label)
      end
      ret
    end

    def to_dot
      <<-"DOT"
  "#{@name}"[
    shape = "#{shape}",
    label = "#{build_label}"
  ]
      DOT
    end

    def build_label
      label = "<title> #{name}\\l "
      actions.each_with_index do |action, idx|
        label << "|<action#{idx}> #{action.name.chomp.gsub("\n", '\l')}\\l "
      end

      label
    end
  end
end
