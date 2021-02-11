class AddKindColumnToCollateralTable < ActiveRecord::Migration[6.0]
  def change
    add_column :collaterals, :kind, :string, null: false, default: ''
  end
end
