module Tags
  class UpdateService
    def initialize(tag, dto)
      @tag = tag
      @dto = dto
    end

    def self.call(tag, dto)
      new(tag, dto).call
    end

    def call
      @tag.update(name: dto.get_name, color: dto.get_color)
      @tag
    end

    private
    attr_reader :tag, :dto
  end
end
