class User < ApplicationRecord
  has_many :settings, dependent: :destroy
  has_many :brands, through: :settings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
