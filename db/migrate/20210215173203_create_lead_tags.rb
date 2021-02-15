class CreateLeadTags < ActiveRecord::Migration[6.0]
  def change
    create_table :lead_tags do |t|
      t.references :lead, null: false
      t.references :tag, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
