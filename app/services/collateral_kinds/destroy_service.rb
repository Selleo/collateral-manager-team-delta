module CollateralKinds
  class DestroyService
    def initialize(collateral_kind)
      @collateral_kind = collateral_kind
    end

    def self.call(collateral_kind)
      new(collateral_kind).call
    end

    def call
      collateral_kind.destroy
    end

    private
    attr_reader :collateral_kind
  end
end
