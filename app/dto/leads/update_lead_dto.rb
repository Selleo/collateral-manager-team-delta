module Tags
  class UpdateLeadDto
    def initialize(data)
      @name = data['name']
      @tags = []

      data['tags'].each do |tag|
        @tags.push(Shared::PositionedTag.new(tag))
      end
    end

    attr_reader :name, :color
  end
end
