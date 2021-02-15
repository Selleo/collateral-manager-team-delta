class CreateCollateralKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :collateral_kinds do |t|
      t.string :name, null: false
      t.string :color, null: false

      t.timestamps
    end
  end
end
