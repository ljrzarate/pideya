class Venue < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :address, :latitude, :longitude, :name, :ower, :venue_type, :slug, :city, :country

  validates :name, presence: true
  validates :address, presence: true

  friendly_id :name, use: :slugged

  after_validation :geocode

  geocoded_by :full_address, latitude: :latitude, longitude: :longitude

  acts_as_api

  api_accessible :venues do |t|
    t.add :name
    t.add :address
    t.add :latitude
    t.add :longitude
  end

  def full_address
    "#{address}, #{city}, #{country}"
  end
end
