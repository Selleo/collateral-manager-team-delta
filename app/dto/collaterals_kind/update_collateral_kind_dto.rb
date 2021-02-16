module CollateralsKind
  class UpdateCollateralKindDto
    def initialize(data)
      @name = data['name']
      @color = data['color']
    end

    private
    attr_reader :name, :color
  end
end
