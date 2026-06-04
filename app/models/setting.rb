class Setting < ApplicationRecord
  belongs_to :settable, polymorphic: true

  validates :key, presence: true
  validates :value, presence: true
end
