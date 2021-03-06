ActiveAdmin.register Lead do

  config.create_another = true

  filter :name
  filter :description

  index do
    id_column
    column :name
    column :description
    column :tags do |collateral|
      collateral.tags.map do |tag|
        span tag.name, class: 'colorfull', style: "background: #{tag.color}80; margin: 0 8px 8px 0"
      end
      nil #NOTE: active admin renders duplicated tags, nil forces to skip showing duplicated tags
    end
    actions
  end

  show do
    panel "Tags for #{lead.name}" do
      raw_html = ""
      lead.lead_tags.each do |lt|
        raw_html += "<div class=\"colorfull\" style=\"background: #{lt.tag.color}\ ; margin-right:10px\">#{lt.tag.name}</div>"
      end
      raw raw_html
    end

    panel "Collaterals for #{lead.name}" do
      table_for LeadMatchedCollateralsCollection.new(lead).get do |c|
        column :name do |n|
          raw "<a href =\"/admin/collaterals/#{n.id}\" target=\"_blank\">#{n.name}</a>"
        end
        column :collateral_kind

        column "MATCHED Collateral Tags" do |c| 
          raw_html = ""
          c.tags.each do |ct|
            lead.lead_tags.each do |lt|
              if lt.tag.id == ct.id then
                raw_html += "<div class=\"colorfull\" style=\"background: #{ct.color}\ ; margin-right:10px\">#{ct.name}</div>"
              end
            end
          end
          raw raw_html
        end

        column "ALL Collateral Tags" do |c| 
          raw_html = ""
          c.tags.each do |ct|
            raw_html += "<div\">[#{ct.name}] </div>"
          end
          raw raw_html
        end
      end
    end
  end

  permit_params :name,
                :description,
                lead_tags_attributes: [:id, :tag_id, :position, :lead_id]


  form title: 'Adding a Lead' do |f|
    inputs 'Details' do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :description
      f.inputs do
        f.has_many :lead_tags, allow_destroy: true do |lead_tag_form|
          lead_tag_form.input :tag_id, as: :select, collection: Tag.all.pluck(:name, :id)
          lead_tag_form.input :position
        end
      end
        f.button :submit
    end
  end
end
