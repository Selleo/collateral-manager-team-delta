# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

COLLATERALS_COUNT = 50
TAGS_COUNT = 150

def generate_tech_tag_ids techTags
    
    techTagIds = []

    for techTag in techTags do 
        t = Tag.new(name: techTag)
        t.save
        techTagIds.push(t.id)
    end  
    techTagIds
end

def generate_random_tags
    i = 0
    tagIds = [] 

    while i < TAGS_COUNT
        if  i % 9 == 0
            t = Tag.new(name: Faker::Educator.unique.subject)
            t.save
        end  
        if  i % 8 == 0
            t = Tag.new(name: Faker::IndustrySegments.unique.sector)
            t.save
        end          
        if  i % 7 == 0
            t = Tag.new(name: Faker::Food.unique.dish)
            t.save
        end
        if i % 20 == 0
            t = Tag.new(name: Faker::IndustrySegments.unique.industry)
            t.save
        end            
        if i % 9 == 0
            t = Tag.new(name: Faker::Commerce.unique.material)
            t.save
        end
        if  i % 9 == 0
            t = Tag.new(name: Faker::Job.unique.field)
            t.save
        end
        if i % 8 == 0
            t = Tag.new(name: Faker::Company.unique.profession)
            t.save
        end
        if i % 7 == 0
            t = Tag.new(name: Faker::Company.unique.industry)
            t.save            
        end
        i+=1
    end

    Tag.find_each do |t|
        tagIds.push(t.id)
    end
    tagIds 
end

def seed_collaterals
    techTags = ["SQL","PHP","Ruby","CSS","Java","JavaScript","C#","Python", "C++", "Ember"]
    collateralTypes = ["webservice", "presentation", "mobileapp", "movie", "blogpost" ]
    techTagIds = []
    randomTechTagIds = []
    tagIds = [] 
    randomTagIds = []

    techTagIds = generate_tech_tag_ids(techTags)
    tagIds = generate_random_tags()

    i = 0
    while i < COLLATERALS_COUNT 
        c = Collateral.new({
            name: "#{Faker::App.name} #{Faker::App.name}",
            url: Faker::Internet.url(host: Faker::Internet.unique.domain_name),
            kind: collateralTypes.sample
        })
        c.save
        i += 1
    end

    Collateral.find_each do |c|
        randmTechTags = techTags.to_a.shuffle.take(rand(1..3))
        for techTagId in randomTechTagIds do 
            ct = CollateralTag.new(
                collateral_id: c.id,
                tag_id: techTagId,
                weight: rand(1..10)
            )
            ct.save
        end

        randomTagIds = tagIds.to_a.shuffle.take(rand(3..6))
        for randomTagId in randomTagIds do 
            ct = CollateralTag.new(
                collateral_id: c.id,
                tag_id: randomTagId,
                weight: rand(1..10)
            )       
            ct.save
        end
    end
    puts '==========================================================================================='
    puts 'DB Seed: Ready.'
    puts "Collateral count = #{Collateral.count}, Tag count = #{Tag.count}, CollateralTag: #{CollateralTag.count} "
    puts '==========================================================================================='
end


seed_collaterals
