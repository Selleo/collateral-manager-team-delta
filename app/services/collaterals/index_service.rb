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
      # Collateral.includes(:collateral_kind).all

      Collateral.all.map do |collateral|
        {
          **collateral.attributes.symbolize_keys.slice(:id, :name, :collateral_kind_id, :url),
        }
      end
    end
  end
end
