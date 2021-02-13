module Tags
  class UpdateTagDto
    def initialize(name, color)
      @name = name
      @color = color
    end

    def get_name
      @name
    end

    def get_color
      @color
    end

    attr_reader :name
    attr_reader :color

    private :name
    private :color
  end
end
