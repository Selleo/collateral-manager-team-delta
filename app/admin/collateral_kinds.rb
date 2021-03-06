ActiveAdmin.register CollateralKind do
  filter :name
  filter :color
  actions :index, :new, :create, :update, :edit, :destroy

  index do |i|
    selectable_column
    column :name do |n| 
      raw "<span class=\"colorfull\" style=\"background:#{n.color}\">#{n.name}</span>"
    end
    column :color
    actions
  end

  permit_params do
    permitted = [:name, :color, :actions]
  end
end
