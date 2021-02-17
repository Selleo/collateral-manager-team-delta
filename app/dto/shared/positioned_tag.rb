module Shared
  class PositionedTag
    def initialize(data)
      @tag_id = data['tag_id']
      @position = data['position']
    end

    attr_reader :tag_id, :position
  end
end