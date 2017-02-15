class Restaurant < ApplicationRecord
  CATEGORIES=%w(chinese italian japanese french belgian)
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  # validates :phone_number, format: { with: /\A[a-zA-Z]+\z/ }
  validates :category, inclusion: { in: Restaurant::CATEGORIES }
end
