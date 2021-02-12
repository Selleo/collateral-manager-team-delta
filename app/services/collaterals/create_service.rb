module Collaterals
  class CreateService
    def initialize(data)
    @data = data
    end

    def call
      create_collateral
    end

    private
    def create_collateral
      Collateral.create(@data).save
    end
  end
end
