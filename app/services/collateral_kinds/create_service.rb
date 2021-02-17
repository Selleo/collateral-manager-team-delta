module CollateralKinds
  class CreateService
    def initialize(dto)
      @dto = dto
    end

    def self.call(dto)
      new(dto).call
    end

    def call
      CollateralKind.create(name: dto.name, color: dto.color)
    end

    private
    attr_reader :dto
  end
end
