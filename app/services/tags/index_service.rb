module Tags
  class IndexService
    def self.call
      new.call
    end

    def call
      collection
    end

    private
    def collection
      Tag.all.map do |tag|
        {
          **tag.attributes.symbolize_keys.slice(:id, :name, :color),
        }
      end
    end
  end
end
