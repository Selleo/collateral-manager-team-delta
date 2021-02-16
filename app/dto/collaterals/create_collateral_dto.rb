module Collaterals
  class CreateCollateralDto
    def initialize(data)
      @name = data['name']
      @kind_id = data['kind_id']
      @url = data['url']
    end

    private
    attr_reader :name, :url, :kind_id
  end
end
