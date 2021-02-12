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
          **collateral.attributes.symbolize_keys.slice(:id, :name, :kind, :url),
        }
      end
    end
  end
end
