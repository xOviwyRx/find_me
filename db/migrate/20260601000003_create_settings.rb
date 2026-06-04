class CreateSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :settings do |t|
      t.references :settable, polymorphic: true, null: false
      t.string :key, null: false
      t.string :value, null: false

      t.timestamps
    end

    add_index :settings, [ :settable_type, :settable_id ],
              unique: true,
              where: "settable_type = 'UserBrand'",
              name: "index_settings_on_user_brand_uniqueness"
  end
end
