class Brand < ApplicationRecord
  has_many :settings, dependent: :destroy
  has_many :users, through: :settings

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
