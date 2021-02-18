module Collections 
    class LeadMatchedCollateralsCollection
        def initialize(lead)
            @lead = lead
        end

        def get_positioned_tags
            positioned_tags = {}
            len = lead.lead_tags.length
            lead.lead_tags.each do |lt| 
                position = abs(len - lt.position)       #position od zera!
                positioned_tags[lt.tag_id] = position
            end
            positioned_tags
        end

        def get_weighted_collaterals
            positioned_tags = get_positioned_tags 
            tag_ids = positioned_tags.keys
            weighted_collaterals = []
            
            CollateralTags.where(tag_id: tag_ids) do |ct| 
                weight = ct.weight * positioned_tags[ct.tag_id].position
                # Przypadki: 
                # 1. Collateral ma "n" tagów, użytkownik wybrał "n"+"m" tagów
                # 2. Collateral ma "n" tagów a użytkownik wybrał "n"-"m" tagów
                # 3. Collateral ma "n" tagów a użytkownik też wybrał "n" tagów
                weight -= abs(tag_ids.length - ct.collateral.collateral_tags.length) 
                weighted_collaterals.push({
                    weight: weight
                    collateral: ct.collateral
                })
            end
            weighted_collaterals
        end

        def get_ordered_collaterals
            ordered_collaterals = get_weighted_collaterals.sort_by {|w| w[:weight]}
            ordered_collaterals.map {|c| c.collateral}
        end

        private
        att_reader: lead
    end
end

