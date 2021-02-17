module Tags
  class DestroyService
    def initialize(tag)
      @tag = tag
    end

    def self.call(tag)
      new(tag).call
    end

    def call
      tag.destroy
    end

    private
    attr_reader :tag
  end
end
