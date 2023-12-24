class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?

  has_many :created_travel_places, foreign_key: 'created_by', class_name: 'TravelPlace', dependent: :destroy
  has_many :favorite_places
  has_many :travel_places, through: :favorite_places

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 150 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true
  
  def agent?
    self.role == 'agent'
  end

  def add_to_favorites(travel_place)
    favorite_places.create(travel_place: travel_place)
  end

  def remove_from_favorites(travel_place)
    favorite_places.find_by(travel_place: travel_place)&.destroy
  end

  def favorite_place?(travel_place)
    favorite_places.exists?(travel_place: travel_place)
  end

  private

  def set_default_role
    self.role ||= 'user'
  end

  

end
