class Brand < ApplicationRecord
  include NormalizesText

  has_many :user_brands, dependent: :destroy
  has_many :users, through: :user_brands
  has_many :settings, as: :settable, dependent: :destroy

  normalizes_text :name

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
