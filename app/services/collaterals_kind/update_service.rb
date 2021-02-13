module CollateralsKind
  class UpdateService
    def initialize(collateral_kind, dto)
      @collateral_kind = collateral_kind
      @dto = dto
    end

    def self.call(collateral_kind, dto)
      new(collateral_kind, dto).call
    end

    def call
      @collateral_kind.update(name: dto.get_name, color: dto.get_color)
      @collateral_kind
    end

    private
    attr_reader :collateral_kind, :dto
  end
end
