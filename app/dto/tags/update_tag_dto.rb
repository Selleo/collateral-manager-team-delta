module Tags
  class UpdateTagDto
    def initialize(data)
      @name = data['name']
      @color = data['color']
    end

    def get_name
      name
    end

    def get_color
      color
    end

    private
    attr_reader :name, :color
  end
end
