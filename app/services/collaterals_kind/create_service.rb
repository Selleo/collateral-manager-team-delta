module CollateralsKind
  class CreateService
    def initialize(dto)
      @dto = dto
    end

    def self.call(dto)
      new(dto).call
    end

    def call
      CollateralKind.create(name: dto.get_name, color: dto.get_color)
    end

    private
    attr_reader :dto
  end
end