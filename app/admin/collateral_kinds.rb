ActiveAdmin.register CollateralKind do

  index do |i|
    selectable_column

    column :name do |n| 
      
    end
    column :color
    column :color do |c|
      raw "<span class=\"colorfull\" style=\"background:#{c.color}\"></span>"
    end
  end

  #permit_params :name, :color
  permit_params do
    permitted = [:name, :color]
  end

end
