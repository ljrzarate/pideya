class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.float :latitude
      t.float :longitud
      t.string :name
      t.string :address
      t.string :city
      t.string :country, default: "Colombia"
      t.string :ower
      t.string :venue_type
      t.string :slug

      t.timestamps
    end
  end
end
