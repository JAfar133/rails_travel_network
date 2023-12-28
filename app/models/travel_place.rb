class TravelPlace < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
    has_many :favorite_places
    has_many :users, through: :favorite_places

    validates :location, presence: true
    validates :name, presence: true, length: { maximum: 100 }
    validates :description, presence: true
end
