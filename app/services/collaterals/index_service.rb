module Collaterals
  class IndexService
    def self.call
      new.call
    end

    def call
      collection
    end

    private

    def collection
      Collateral.includes([:collateral_kind, :tags]).all.map do |collateral|
        {
          id: collateral.id,
          name: collateral.name,
          url: collateral.url,
          kind: {
            name: collateral.collateral_kind.name,
            color: collateral.collateral_kind.color
          },
          tags: collateral.tags.map {|c| c.slice(:name, :color) }
        }
      end
    end
  end
end
