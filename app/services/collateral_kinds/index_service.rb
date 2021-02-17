module CollateralKinds
  class IndexService
    def self.call
      new.call
    end

    def call
      collection
    end

    private
    def collection
      CollateralKind.all.map do |collateral_kind|
        {
          **collateral_kind.attributes.symbolize_keys.slice(:id, :name, :color),
        }
      end
    end
  end
end
