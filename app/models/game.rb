class Game < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking
  has_one_attached :photo

  validates :name, :description, :address, :price_per_day, :disponibility, presence: true
end
