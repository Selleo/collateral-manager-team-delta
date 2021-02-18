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
    panel "Collaterals for #{lead.name}" do
      table_for Leads::SearchService.call(lead) do
        column :name
        column :collateral_kind
      end
    end
  end

  form title: 'Adding a Lead' do |f|
    inputs 'Details' do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :description

      # NOTE: PoC only
        # ul id: "sortable" do
        #   li id: "1", class: "drag ui-state-default ui-icon ui-icon-arrowthick-2-n-s", style: "height: 50px; border: 2px solid red;"
        #   li id: "2", class: "drag ui-state-default ui-icon ui-icon-arrowthick-2-n-s", style: "height: 50px; border: 2px solid red;"
        #   li id: "3", class: "drag ui-state-default ui-icon ui-icon-arrowthick-2-n-s", style: "height: 50px; border: 2px solid red;"
        #   li id: "4", class: "drag ui-state-default ui-icon ui-icon-arrowthick-2-n-s", style: "height: 50px; border: 2px solid red;"
        #   li id: "5", class: "drag ui-state-default ui-icon ui-icon-arrowthick-2-n-s", style: "height: 50px; border: 2px solid red;"
        #   li id: "6", class: "drag ui-state-default ui-icon ui-icon-arrowthick-2-n-s", style: "height: 50px; border: 2px solid red;"
        #   li id: "7", class: "drag ui-state-default ui-icon ui-icon-arrowthick-2-n-s", style: "height: 50px; border: 2px solid red;"
        # end

        if f.object.persisted?
          f.has_many :lead_tags, class: "sortable" do |lead_tag_form|
              lead_tag_form.input :tag_id, collection: Tag.all, as: :select
              lead_tag_form.input :position
              lead_tag_form.input :lead_id, :input_html => { :value => f.object.id }, as: :hidden, class: "drag"
          end
        end
      # end

      f.button :submit
    end
  end

end
