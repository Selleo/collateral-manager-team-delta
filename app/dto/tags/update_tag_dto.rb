module Tags
  class UpdateTagDto
    def initialize(data)
      @name = data['name']
      @color = data['color']
    end

    private
    attr_reader :name, :color
  end
end
