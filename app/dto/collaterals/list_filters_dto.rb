module Collaterals
  class ListFiltersDto
    def initialize(data)
      @kind = data['kind']
      @url = data['url']
      @tags = []

      data['tags'].each do |tag|
        @tags.push(Shared::PositionedTag.new(tag))
      end
    end

    attr_reader :tags, :url, :kind_id
  end
end
