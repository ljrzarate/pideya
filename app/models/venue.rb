class Venue < ActiveRecord::Base
  extend FriendlyId
  acts_as_api


  attr_accessible :address, :latitude, :longitude, :name, :owner, :venue_type, :slug, :city, :country, :description, :phone

  validates :name, presence: true
  validates :address, presence: true

  friendly_id :name, use: :slugged

  geocoded_by :latitude => :latitude, :longitude => :longitude

  api_accessible :venues do |t|
    t.add :name
    t.add :address
    t.add :latitude
    t.add :longitude
    t.add :description
    t.add :phone
  end

  def full_address
    "#{address}, #{city}, #{country}"
  end
end
