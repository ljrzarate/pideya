class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.string :city
      t.string :country, default: "Colombia"
      t.string :owner
      t.string :venue_type
      t.string :slug
      t.text   :description
      t.string :phone
      t.string :schedule

      t.timestamps
    end
  end
end
