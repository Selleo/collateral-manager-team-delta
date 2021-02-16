module Collaterals
  class UpdateService
    def initialize(collateral, dto)
      @collateral = collateral
      @dto = dto
    end

    def self.call(collateral, dto)
      new(collateral, dto).call
    end

    def call
      collateral.update(
        name: dto.get_name,
        collateral_kinds_id: dto.get_kind_id,
        url: dto.get_url
      )
      collateral
    end

    private
    attr_reader :collateral, :dto
  end
end
