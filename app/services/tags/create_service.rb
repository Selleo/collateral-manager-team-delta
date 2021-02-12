module Tags
    class CreateService
      def initialize(data)
        @data = data
      end

      def self.call(data)
        new(data).call
      end

      def call
        Tag.create(data)
      end

      private
      attr_reader :data
    end
  end
