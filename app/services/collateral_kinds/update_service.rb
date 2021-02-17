module CollateralKinds
  class UpdateService
    def initialize(collateral_kind, dto)
      @collateral_kind = collateral_kind
      @dto = dto
    end

    def self.call(collateral_kind, dto)
      new(collateral_kind, dto).call
    end

    def call
      collateral_kind.update(name: dto.name, color: dto.color)
      collateral_kind
    end

    private
    attr_reader :collateral_kind, :dto
  end
end
