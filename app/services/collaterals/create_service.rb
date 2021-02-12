module Collaterals
  class CreateService
    def initialize(data)
      @data = data
    end

    def self.call(data)
      new(data).call
    end

    def call
      Collateral.create(data)
    end

    private
    attr_reader :data
  end
end
