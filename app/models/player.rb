class Player < ApplicationRecord
  has_many :attendances
  validates :nome, presence: true, length: {minimum: 3}
  validates :personagem, presence: true, length: {minimum: 5}
end
