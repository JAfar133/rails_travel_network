class AddFavoritePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_places do |t|
      t.references :user, foreign_key: true
      t.references :travel_place, foreign_key: true
      t.index ["user_id","travel_place_id"], :unique => true
    end
  end
end