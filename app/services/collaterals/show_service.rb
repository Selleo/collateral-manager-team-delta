module Collaterals
  class ShowService
    def initialize(collateral_id)
      @collateral_id = collateral_id
    end

    def self.call(collateral_id)
      new(collateral_id).call
    end

    def call
      Collateral.find(collateral_id)
    end

    private
    attr_reader :collateral_id
  end
end
