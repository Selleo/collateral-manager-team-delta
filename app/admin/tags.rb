ActiveAdmin.register Tag do

  config.create_another = true

  permit_params :name, :color
  filter :name
  filter :color
  actions :all, :except => [:show]

  index do
    selectable_column
    column :name do |n|
      raw "<span class=\"colorfull\" style=\"background:#{n.color}\">#{n.name}</span>"
    end
    column :color
    actions
  end
end
