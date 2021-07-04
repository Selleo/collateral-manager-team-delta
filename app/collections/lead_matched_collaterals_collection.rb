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
    collateral_ids_map = {}

    CollateralTag.includes([:collateral]).where(tag_id: tag_ids).each do |ct|
      collateral_ids_map[ct.collateral.id] = true
    end

    collateral_ids = collateral_ids_map.keys

    Collateral.includes([:collateral_tags]).where(id: collateral_ids).each do |c|
      weight = 0
      items = []
      c.collateral_tags.each do |ct|
        if positioned_tags[ct.tag_id]
          weight += ct.weight * positioned_tags[ct.tag_id]
          items.push(ct.weight * positioned_tags[ct.tag_id])
        end
      end
      diff = get_tags_count_diff(tag_ids, c.collateral_tags)
      weight -= diff.length
      weighted_collaterals.push({ weight: weight, collateral: c })
    end

    weighted_collaterals
  end

  def get_ordered_collaterals
    ordered_collaterals = get_weighted_collaterals.sort_by { |w| -w[:weight] }
    ordered_collaterals.map do |oc|
      oc[:collateral]
    end
  end

  def get_tags_count_diff(tag_ids, collateral_tags)
    diff = 0
    collateral_tag_ids = collateral_tags.map do |ct|
      ct[:tag_id]
    end

    tag_ids.each do |ti|
      unless collateral_tag_ids.include? ti
        diff += 1
      end
    end

    tag_ids - collateral_tag_ids | collateral_tag_ids - tag_ids
  end

  attr_reader :lead
end