ActiveAdmin.register Lead do

  config.create_another = true

  filter :name
  filter :description

  index do
    id_column
    column :name
    column :description
    actions
  end

  show do
    panel "Collaterals for #{lead.name}" do
      table_for Leads::SearchService.call(lead) do
        column :name
        column :collateral_kind
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
