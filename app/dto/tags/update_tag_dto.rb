module Tags
  class UpdateTagDto
    def initialize(data)
      @name = data['name']
      @color = data['color']
    end

    attr_reader :name, :color
  end
end
