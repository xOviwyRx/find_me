class CreateUserBrands < ActiveRecord::Migration[8.0]
  def change
    create_table :user_brands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_brands, [ :user_id, :brand_id ], unique: true
  end
end
