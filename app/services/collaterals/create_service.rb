module Collaterals
  class CreateService
    def initialize(dto)
      @dto = dto
    end

    def self.call(dto)
      new(dto).call
    end

    def call
      Collateral.create(
        name: dto.get_name,
        collateral_kinds_id: dto.get_kind_id,
        url: dto.get_url
      )
    end

    private
    attr_reader :dto
  end
end
