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
                                      collateral_kinds_id: random_kind_id
                                    })
    new_collateral.save

    i += 1
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
  puts "Collateral count = #{Collateral.count}, Tag count = #{Tag.count}, CollateralTag: #{CollateralTag.count} CollateralKind: #{CollateralKind.count}"
  puts '==========================================================================================='
end

seed_collaterals
