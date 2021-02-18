ActiveAdmin.register Lead do

  config.create_another = true
  permit_params :name, :description, :lead_tags_attributes => [:id, :tag_id, :position, :lead_id]

  filter :name
  filter :description

  index do
    id_column
    column :name
    column :description
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
      table_for Leads::SearchService.call(lead) do |c|
        column :name
        column :collateral_kind

        column :collateral_tags do |ct| 
          #raw_html = ""
          #c.collateral_tags.each do |ct|
          #  raw_html += c
            #raw_html += "<div class=\"colorfull\" style=\"background: #{ct.tag.color}\ ; margin-right:10px\">#{ct.tag.name}</div>"
          #end

          raw ct.name
        end

      end
    end
  end

  form title: 'Adding a Lead' do |f|
    inputs 'Details' do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :description
      if f.object.persisted?
        f.has_many :lead_tags do |lead_tag_form|
          lead_tag_form.input :tag_id, collection: Tag.all, as: :select
          lead_tag_form.input :position
          lead_tag_form.input :lead_id, :input_html => { :value => f.object.id }, as: :hidden
        end
      end
        f.button :submit
    end
  end

end
