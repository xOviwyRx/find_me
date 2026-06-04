class UserBrand < ApplicationRecord
  belongs_to :user
  belongs_to :brand, counter_cache: :users_count

  has_one :setting, as: :settable, dependent: :destroy

  validates :user_id, uniqueness: { scope: :brand_id }
end
