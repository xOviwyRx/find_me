class AddUsersCountCheckConstraintToBrands < ActiveRecord::Migration[8.0]
  def change
    add_check_constraint :brands, "users_count >= 0", name: "brands_users_count_non_negative"
  end
end
