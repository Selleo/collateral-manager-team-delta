module Collaterals
  class DestroyService
    def initialize(collateral)
      @collateral = collateral
    end

    def self.call(collateral)
      new(collateral).call
    end

    def call
      collateral.destroy
    end

    private
    attr_reader :collateral
  end
end
