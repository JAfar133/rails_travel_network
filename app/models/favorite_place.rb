class FavoritePlace < ApplicationRecord
    belongs_to :user
    belongs_to :travel_place
end

