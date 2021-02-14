module Collaterals
  class CreateCollateralDto
    def initialize(data)
      @name = data['name']
      @kind_id = data['kind_id']
      @url = data['url']
    end

    def get_name
      name
    end

    def get_url
      url
    end

    def get_kind_id
      kind_id
    end

    private
    attr_reader :name, :url, :kind_id
  end
end
