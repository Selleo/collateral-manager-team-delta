module Collaterals
  class UpdateService
    def initialize(collateral, data)
      @collateral = collateral
      @data = data
    end

    def self.call(collateral, data)
      new(collateral, data).call
    end

    def call
      collateral.update(data)
      collateral
    end

    private
    attr_reader :collateral, :data
  end
end
