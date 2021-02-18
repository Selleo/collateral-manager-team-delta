class LeadMatchedCollateralsCollection
  include Enumerable

  def initialize(lead)
    @lead = lead
  end

  def get
    get_ordered_collaterals
  end

  def map
    get_ordered_collaterals.each { |c| yield c }
  end

  def each
    get_ordered_collaterals.each { |c| yield c }
  end

  private

  def get_positioned_tags
    positioned_tags = {}
    len = lead.lead_tags.length
    lead.lead_tags.each do |lt|
      position = (len - lt.position).abs #position od zera!
      positioned_tags[lt.tag_id] = position
    end
    positioned_tags
  end

  def get_weighted_collaterals
    positioned_tags = get_positioned_tags
    tag_ids = positioned_tags.keys
    weighted_collaterals = []

    CollateralTag.includes([:collateral]).where(tag_id: tag_ids).each do |ct|
      weight = ct.weight * (positioned_tags[ct.tag_id] + 1)
      # Przypadki:
      # 1. Collateral ma "n" tagów, użytkownik wybrał "n"+"m" tagów
      # 2. Collateral ma "n" tagów a użytkownik wybrał "n"-"m" tagów
      # 3. Collateral ma "n" tagów a użytkownik też wybrał "n" tagów
      weight -= (tag_ids.length - ct.collateral.collateral_tags.length).abs
      weighted_collaterals.push({
                                  weight: weight,
                                  collateral: ct.collateral
                                })
    end

    weighted_collaterals
  end

  def get_ordered_collaterals
    ordered_collaterals = get_weighted_collaterals.sort_by { |w| -w[:weight] }
    ordered_collaterals.map do |oc|
      oc[:collateral]
    end

  end

  private

  attr_reader :lead
end