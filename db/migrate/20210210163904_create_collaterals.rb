class CreateCollaterals < ActiveRecord::Migration[6.0]
  def change
    create_table :collaterals do |t|
      t.references :collateral_kind, null: false, foreign_key: true
      t.text :name, null: false
      t.text :url

      t.timestamps
    end
  end
end
