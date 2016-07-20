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
    shape = "none",
    label = #{build_label}
  ]
      DOT
    end

    def build_label
      label = %Q|<<TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">|
      label << "<TR><TD><B>#{@name}</B></TD></TR>"
      actions.each_with_index do |action, idx|
        label << %Q|<TR><TD ALIGN="LEFT" PORT="action#{idx}">#{action.name.chomp.gsub("\n", '<BR ALIGN="LEFT"/>')}<BR ALIGN="LEFT"/></TD></TR>|
      end
      label << "</TABLE>>"

      label
    end
  end
end
