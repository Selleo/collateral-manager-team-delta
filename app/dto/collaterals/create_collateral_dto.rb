module Collaterals
  class CreateCollateralDto
    def initialize(name, kind_id, url)
      @name = name
      @kind_id = kind_id
      @url = url
    end

    def get_name
      @name
    end

    def get_url
      @url
    end

    def get_kind_id
      @kind_id
    end

    attr_reader :name
    attr_reader :url
    attr_reader :kind_id

    private :name
    private :url
    private :kind_id
  end
end
