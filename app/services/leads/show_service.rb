module Leads
  class ShowService
    def initialize(lead_id)
      @lead_id = lead_id
    end

    def self.call(lead_id)
      new(lead_id).call
    end

    def call
      lead = Lead.find(lead_id)

      result = {
        lead: lead,
        collaterals: []
      }

      lead_matched_collaterals = LeadMatchedCollateralsCollection.new(lead)
      return lead_matched_collaterals.get
      collaterals = lead_matched_collaterals.get.map do |collateral|
        {
          id: collateral.id,
          name: collateral.name,
          # url: collateral.url,
          # kind: {
          #   name: collateral.collateral_kind.name,
          #   color: collateral.collateral_kind.color
          # },
          # tags: collateral.tags.map { |c| c.slice(:name, :color) }
        }
      end
      result['collaterals'] = collaterals

      result
    end

    private

    attr_reader :lead_id
  end
end
