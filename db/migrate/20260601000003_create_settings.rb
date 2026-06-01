class CreateSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :settings do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :key
      t.string :value

      t.timestamps
    end

    add_index :settings, [:user_id, :brand_id], unique: true
  end
end
