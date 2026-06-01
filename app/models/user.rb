class User < ApplicationRecord
  include NormalizesText

  has_many :settings, dependent: :destroy
  has_many :brands, through: :settings

  normalizes_text :first_name, :last_name, :email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
