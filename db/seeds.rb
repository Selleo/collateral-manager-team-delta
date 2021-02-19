# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

COLLATERALS_COUNT = 5
LEADS_COUNT = 5
TAGS_COUNT = 10
DESCRIPTION = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris lorem augue, commodo id nibh sit amet, viverra bibendum urna. Vestibulum faucibus odio ipsum. Phasellus ut dapibus leo. Quisque quis iaculis felis. Donec vulputate tempus est, eget tempus eros vulputate nec. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam non eros et enim fermentum mollis. Mauris sit amet consequat metus. Vivamus maximus enim magna, at varius quam tempus vitae. Morbi risus ante, dictum ac tellus finibus, ultricies iaculis elit."

def generate_collateral_kinds
  kinds_ids = []

  kinds_names = [
    "post",
    "vlog",
    "video",
    "case study",
    "web service",
    "presentation",
    "app",
    "movie",
    "blog",
    "e-book",
    "slide-deck",
    "prototype",
  ]

  kinds_names.each do |kind_name|
    new_kind = CollateralKind.new(name: kind_name, color: Faker::Color.hex_color)
    new_kind.save
    kinds_ids.push(new_kind.id)
  end

  kinds_ids
end

def generate_tech_tag_ids
  tech_tags = %w[SQL PHP Ruby CSS Java JavaScript C# Python C++ Ember C# Xamarin Angular React TypeScript]
  tech_tag_ids = []

  tech_tags.each do |tech_tag|
    t = Tag.new(name: tech_tag, color: Faker::Color.hex_color)
    t.save
    tech_tag_ids.push(t.id)
  end

  tech_tag_ids
end

def generate_random_tags
  i = 0
  tag_ids = []

  while i < TAGS_COUNT
    if i % 9 == 0
      t = Tag.new(name: Faker::Educator.unique.subject, color: Faker::Color.hex_color)
      t.save
    end
    if i % 8 == 0
      t = Tag.new(name: Faker::IndustrySegments.unique.sector, color: Faker::Color.hex_color)
      t.save
    end
    if i % 7 == 0
      t = Tag.new(name: Faker::Food.unique.dish, color: Faker::Color.hex_color)
      t.save
    end
    if i % 20 == 0
      t = Tag.new(name: Faker::IndustrySegments.unique.industry, color: Faker::Color.hex_color)
      t.save
    end
    if i % 9 == 0
      t = Tag.new(name: Faker::Commerce.unique.material, color: Faker::Color.hex_color)
      t.save
    end
    if i % 9 == 0
      t = Tag.new(name: Faker::Job.unique.field, color: Faker::Color.hex_color)
      t.save
    end
    if i % 8 == 0
      t = Tag.new(name: Faker::Company.unique.profession, color: Faker::Color.hex_color)
      t.save
    end
    if i % 7 == 0
      t = Tag.new(name: Faker::Company.unique.industry, color: Faker::Color.hex_color)
      t.save
    end
    i += 1
  end

  Tag.find_each do |tag|
    tag_ids.push(tag.id)
  end

  tag_ids
end

def seed_collaterals
  tech_tag_ids = generate_tech_tag_ids
  tag_ids = generate_random_tags
  kinds_ids = generate_collateral_kinds
  kinds_count = kinds_ids.length - 1

  i = 0
  while i < COLLATERALS_COUNT
    random_kind_id = kinds_ids.shuffle.take(rand(1..kinds_count)).first

    new_collateral = Collateral.new({
                                      name: "#{Faker::App.name} #{Faker::App.name}",
                                      url: Faker::Internet.url(host: Faker::Internet.unique.domain_name),
                                      collateral_kind_id: random_kind_id
                                    })
    new_collateral.save

    i += 1
  end

  i = 0
  while i < LEADS_COUNT
    new_lead = Lead.new({
                          name: "#{Faker::App.name}",
                          description: Faker::Lorem.paragraphs,
                        })
    new_lead.save

    i += 1
  end

  Lead.find_each do |lead|
    tag_id = tech_tag_ids.to_a.shuffle.first

    new_lead_tag = LeadTag.new({
                                 tag_id: tag_id,
                                 lead_id: lead.id,
                                 position: 0
                               })
    new_lead_tag.save

    random_tags_count = rand(1..8)
    i = 0
    index = 1
    while i < random_tags_count
      random_tag_id = tag_ids.to_a.shuffle.first

      LeadTag.create({
                       tag_id: random_tag_id,
                       lead_id: lead.id,
                       position: index
                     })
      index += 1
      i += 1
    end
  end

  Collateral.find_each do |c|
    random_tag_ids = tech_tag_ids.to_a.shuffle.take(rand(1..3))
    for tech_tag_id in random_tag_ids do
      ct = CollateralTag.new(
        collateral_id: c.id,
        tag_id: tech_tag_id,
        weight: rand(1..10)
      )
      ct.save
    end

    random_tag_ids = tag_ids.to_a.shuffle.take(rand(3..6))
    for random_tag_id in random_tag_ids do
      ct = CollateralTag.new(
        collateral_id: c.id,
        tag_id: random_tag_id,
        weight: rand(1..10)
      )
      ct.save
    end
  end

  puts '==========================================================================================='
  puts 'DB Seed: Ready.'
  puts "Collaterals: #{Collateral.count}"
  puts "Tags: #{Tag.count}"
  puts "CollateralTags: #{CollateralTag.count}"
  puts "CollateralKinds: #{CollateralKind.count}"
  puts "Leads: #{Lead.count}"
  puts "LeadTags: #{LeadTag.count}"
  puts '==========================================================================================='
end
# seed_collaterals

def test_seed
  #Tags
  tag_1 = Tag.create(name: "Tag 1", color: Faker::Color.hex_color)
  tag_2 = Tag.create(name: "Tag 2", color: Faker::Color.hex_color)
  tag_3 = Tag.create(name: "Tag 3", color: Faker::Color.hex_color)
  tag_4 = Tag.create(name: "Tag 4", color: Faker::Color.hex_color)
  tag_5 = Tag.create(name: "Tag 5", color: Faker::Color.hex_color)

  # Collateral kinds
  collateral_kind_1 = CollateralKind.create(name: "prototype", color: Faker::Color.hex_color)
  collateral_kind_2 = CollateralKind.create(name: "POC", color: Faker::Color.hex_color)
  collateral_kind_3 = CollateralKind.create(name: "post", color: Faker::Color.hex_color)
  collateral_kind_4 = CollateralKind.create(name: "web service", color: Faker::Color.hex_color)

  # Leads
  lead_1 = Lead.create(name: "Lead 1", description: DESCRIPTION)
  lead_1.lead_tags.create(position: 0, tag: tag_1)
  lead_1.lead_tags.create(position: 1, tag: tag_2)
  lead_1.lead_tags.create(position: 2, tag: tag_3)

  lead_2 = Lead.create(name: "Lead 2", description: DESCRIPTION)
  lead_2.lead_tags.create(position: 0, tag: tag_5)
  lead_2.lead_tags.create(position: 1, tag: tag_1)

  # Collaterals
  collateral_1 = Collateral.create(name: "Collateral 1", collateral_kind: collateral_kind_1, url: Faker::Internet.url(host: Faker::Internet.unique.domain_name))
  collateral_1.collateral_tags.create(weight: 10, tag: tag_1)
  collateral_1.collateral_tags.create(weight: 9, tag: tag_5)
  collateral_1.collateral_tags.create(weight: 3, tag: tag_2)
  collateral_1.collateral_tags.create(weight: 9, tag: tag_4)

  collateral_2 = Collateral.create(name: "Collateral 2", collateral_kind: collateral_kind_2, url: Faker::Internet.url(host: Faker::Internet.unique.domain_name))
  collateral_2.collateral_tags.create(weight: 6, tag: tag_2)
  collateral_2.collateral_tags.create(weight: 9, tag: tag_3)

  collateral_3 = Collateral.create(name: "Collateral 3", collateral_kind: collateral_kind_3, url: Faker::Internet.url(host: Faker::Internet.unique.domain_name))
  collateral_3.collateral_tags.create(weight: 10, tag: tag_1)
  collateral_3.collateral_tags.create(weight: 9, tag: tag_2)
  collateral_3.collateral_tags.create(weight: 10, tag: tag_3)

  collateral_4 = Collateral.create(name: "Collateral 4", collateral_kind: collateral_kind_2, url: Faker::Internet.url(host: Faker::Internet.unique.domain_name))
  collateral_4.collateral_tags.create(weight: 10, tag: tag_1)
  collateral_4.collateral_tags.create(weight: 5, tag: tag_4)

  collateral_5 = Collateral.create(name: "Collateral 5", collateral_kind: collateral_kind_4, url: Faker::Internet.url(host: Faker::Internet.unique.domain_name))
  collateral_5.collateral_tags.create(weight: 7, tag: tag_5)

  collateral_6 = Collateral.create(name: "Collateral 6", collateral_kind: collateral_kind_3, url: Faker::Internet.url(host: Faker::Internet.unique.domain_name))
  collateral_6.collateral_tags.create(weight: 5, tag: tag_4)
  collateral_6.collateral_tags.create(weight: 3, tag: tag_5)

end

test_seed
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?