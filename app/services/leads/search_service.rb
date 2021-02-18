module Leads
    class SearchService
      def self.call(lead)
        new.call(lead)
      end

      def call(lead)
        collection
      end

      private
      def collection
        Collateral.all
      end
    end
  end
