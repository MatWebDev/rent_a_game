class Game < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo

  validates :name, :description, :address, :price_per_day, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
