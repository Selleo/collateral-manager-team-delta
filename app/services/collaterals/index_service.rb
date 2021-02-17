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
      Collateral.all.map do |collateral|
        {
          id: collateral.id,
          name: collateral.name,
          url: collateral.url,
          kind: {
            name: collateral.collateral_kind.name,
            color: collateral.collateral_kind.color
          },
          tags: collateral.collateral_tags.map do |collateral_tag|
            {
              name: collateral_tag.tag.name,
              color: collateral_tag.tag.color
            }
          end
        }
      end
    end
  end
end
