class CreateTravelPlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :travel_places do |t|
      t.string :location
      t.string :name
      t.text :description
      t.integer :created_by
      t.timestamps
    end
  end
end
