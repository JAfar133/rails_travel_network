class AddFavoritePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_places do |t|
      t.references :user, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.references :travel_place, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.index ["user_id", "travel_place_id"], :unique => true
    end
  end
end
