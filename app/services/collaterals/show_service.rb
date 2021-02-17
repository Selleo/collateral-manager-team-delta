module Collaterals
  class ShowService
    def initialize(collateral_id)
      @collateral_id = collateral_id
    end

    def self.call(collateral_id)
      new(collateral_id).call
    end

    def call
      c = Collateral.find(collateral_id)
      {
        **c.attributes.symbolize_keys.slice(:id, :name, :url),
        kind: {
          name: c.collateral_kind.name,
          color: c.collateral_kind.color,
        },
        tags: c.tags.map {|t| t.slice(:name, :color)}
      }
    end

    private
    attr_reader :collateral_id
  end
end
