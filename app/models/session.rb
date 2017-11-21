class Session < ApplicationRecord
  has_many :attendances
  validates :data, presence: true
end
