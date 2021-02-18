ActiveAdmin.register Collateral do

  filter :collateral_kind, :as => :check_boxes
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
    column :tags do |collateral|
      collateral.tags.map do |tag|
        span tag.name, class: 'colorfull', style: "background: #{tag.color}80; margin: 0 8px 8px 0"
      end
      nil #NOTE: active admin renders duplicated tags, nil forces to skip showing duplicated tags
    end
    actions
  end

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
            span tag.name, class: 'colorfull', style: "background: #{tag.color}80; margin: 0 8px 8px 0"
          end
          nil #NOTE: active admin renders duplicated tags, nil forces to skip showing duplicated tags
        end
      end
    end
  end

  permit_params :name,
                :url,
                :collateral_kind_id,
                collateral_tags_attributes: [:id, :tag_id, :weight, :_destroy]

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :url
      f.input :collateral_kind
    end
    f.inputs do
      f.has_many :collateral_tags, allow_destroy: true do |t|
        t.input :tag_id, :as => :select, :collection => Tag.pluck(:name, :id)
        t.input :weight, :as => :number
      end
    end
    f.actions
  end


end
