ActiveAdmin.register Collateral do

  filter :collateral_kinds_id
  filter :name
  
  #actions :index, :show, :new, :create, :update, :edit

  index do |i|
    selectable_column
    column :collateral_kinds_id do |ck|
      raw "<span class=\"colorfull\" style=\"background:#{ck.collateral_kind&.color}\">#{ck.collateral_kind&.name}</span>"
    end
    column :name
    column :url
    actions
  end

  permit_params do
    permitted = [:name, :color, :actions]
  end
  
end
