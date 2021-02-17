ActiveAdmin.register Collateral do

  filter :collateral_kinds_id
  filter :name

  actions :index, :show, :new, :create, :update, :edit, :destroy

  index do |i|
    selectable_column
    column :collateral_kinds_id do |ck|
      raw "<span class=\"colorfull\" style=\"background:#{ck.collateral_kind&.color}\">#{ck.collateral_kind&.name}</span>"
    end
    column :name
    column :url do |u|
      raw "<a href=\"#{u.url}\" target=\"_blank\">#{u.url}</a>"
    end
    actions
  end

  permit_params :name, :color, :actions, :url, :collateral_kind_id

  show do
    panel "Collateral details" do
      attributes_table_for collateral do
        row :name
        row :collateral_kind
        row 'url' do
          a collateral.url, href: collateral.url, target: "_blank"
        end
        row 'Tags' do
          collateral.tags.each do |tag|
            span tag.name, class: 'colorfull', style: "background: #{tag.color}; margin: 0 16px 16px 0"
          end
          nil #NOTE: active admin renders duplicated tags, nil forces to skip showing duplicated tags
        end
      end
    end
  end

end
