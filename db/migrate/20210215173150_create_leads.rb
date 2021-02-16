class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string :name, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
