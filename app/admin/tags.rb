ActiveAdmin.register Tag do

  permit_params :name, :color
  filter :name
  filter :color
  actions :all, :except => [:show]

  index do
    id_column
    column :name
    column :color do |tag|
      raw "<div class=\"colorfull\" style=\"background-color: #{tag.color}\">#{tag.name}</div>"
    end
    actions
  end
end
