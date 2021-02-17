#TODO:
def search_alghoritm_start
    #Tworze testowy lead
    l = Lead.new(name: "Test", description: "Desc")
    l.save
  
    #dopisuję do niego takie tagi jakie są powiązane z collateral'ami - testowo:
    i = 0
    CollateralTags.find_each do |ct|
      i+=1
      while i < 7
        puts "Lead #{l.name} wiążę z tagiem #{ct.tag&.name}"
        lt = LeadTag.new(lead_id: l.id, tag_id: ct.tag_id, position: i)
        lt.save
      end
    end
  end

