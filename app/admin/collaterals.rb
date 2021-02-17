ActiveAdmin.register Collateral do

  filter :collateral_kind, :as => :check_boxes
  filter :name
  
  actions :index, :show, :new, :create, :update, :edit, :destroy

  index do |i|
    selectable_column
    column :collateral_kinds_id do |ck|
      raw "<span class=\"colorfull\" style=\"background:#{ck.collateral_kind&.color}\">#{ck.collateral_kind&.name}</span>"
    end
    column :name do |n|
      raw "<a href=\"#{n.url}\" target=\"_blank\">#{n.name}</a>"
    end
    column :url do |u| 
      raw "<a href=\"#{u.url}\" target=\"_blank\">#{u.url}</a>"
    end
    actions
  end

  permit_params do
    permitted = [:name, :color, :actions, :url, :collateral_kind_id]
  end
  
end
