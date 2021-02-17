module leads
  class ShowService
    def initialize(lead_id)
      @lead_id = lead_id
    end

    def self.call(lead_id)
      new(lead_id).call
    end

    def call
      lead = Lead.find(lead_id)
      search_alghoritm_start(lead)
    end

    private
    attr_reader :lead_id

    # def search_alghoritm_start(lead)
    #   LeadTag.find_by(lead_id: lead_id) do |lt|
    #     CollateralTags.find_by(tag_id: lt.tag_id).order("weight DESC") |ct| do 

    #     end
    #   end
    # end
  end
end

