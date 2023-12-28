class TravelPlace < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'created_by'

    validates :location, presence: true
    validates :name, presence: true, length: { maximum: 100 }
    validates :description, presence: true
end
