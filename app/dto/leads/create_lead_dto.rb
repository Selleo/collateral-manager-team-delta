module Tags
  class CreateLeadDto
    def initialize(data)
      @name = data['name']
      @color = data['color']
      @tags = []

      data['tags'].each do |tag|
        @tags.push(Shared::PositionedTag.new(tag))
      end
    end

    attr_reader :name, :color
  end
end
