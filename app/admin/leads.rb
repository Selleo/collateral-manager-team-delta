ActiveAdmin.register Lead do

  config.create_another = true
  permit_params :name, :description

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

  # create do
  #   panel "Collaterals for #{lead.name}" do
  #     table_for Leads::SearchService.call(lead) do
  #       column :name
  #       column :collateral_kind
  #     end
  #   end
  # end

  # form title: 'A custom title' do |f|
  #   inputs 'Details' do
  #     f.input :name
  #     f.input :description
  #     f.input :collateral_tags, :as => :select ,:collection => collateral_kind
  #     f.button :submit
  #   end
  # end

end
