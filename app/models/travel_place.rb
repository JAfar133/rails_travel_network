class TravelPlace < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
    has_many :favorite_places
    has_many :users, through: :favorite_places
end
