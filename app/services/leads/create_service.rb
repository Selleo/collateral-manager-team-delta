module Collaterals
  class CreateService
    def initialize(dto)
      @dto = dto
    end

    def self.call(dto)
      new(dto).call
    end

    def call
      new_lead = Lead.new(
        name: dto.name,
        description: dto.description,
      )
      new_lead.save

      dto.tags.each do |tag|
        LeadTag.create(
          tag_id: tag,
          lead_id: new_lead.id
        )
      end
    end

    private
    attr_reader :dto
  end
end
