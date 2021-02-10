class CreateCollateralTags < ActiveRecord::Migration[6.0]
  def change
    create_table :collateral_tags do |t|
      t.references :collateral, null: false
      t.references :tag, null: false
      t.integer :weight, null: false

      t.timestamps
    end
  end
end
