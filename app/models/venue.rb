class Venue < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :address, :latitude, :longitud, :name, :ower, :venue_type, :slug, :city, :country

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitud, presence: true

  friendly_id :name, use: :slugged

  after_validation :geocode

  geocoded_by :full_address, latitude: :latitude, longitude: :longitude

  def full_address
    "#{address}, #{city}, #{country}"
  end
end
