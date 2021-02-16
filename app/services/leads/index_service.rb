module Leads
  class IndexService
    def self.call
      new.call
    end

    def call
      collection
    end

    private
    def collection
      Lead.all
    end
  end
end
