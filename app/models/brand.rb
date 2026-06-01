class Brand < ApplicationRecord
  include NormalizesText

  has_many :settings, dependent: :destroy
  has_many :users, through: :settings

  normalizes_text :name

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
