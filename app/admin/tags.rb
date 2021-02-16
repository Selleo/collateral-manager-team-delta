ActiveAdmin.register Tag do

  permit_params :name, :color
  # filter :first_name_or_last_name_cont, as: :string, label: "Name"
  filter :name, as: :check_boxes

  index do
    id_column
    column :name
    column :color do |tag|
      raw "<div class=\"color-full\" style=\"background-color: #{tag.color}\"></div>"
    end
    actions
  end


end
