class TravelPlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_travel_place, only: [:edit, :show, :update, :destroy, :add_to_favorites]
  
  load_and_authorize_resource

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @travel_places = TravelPlace.all
  end

  def new
    @travel_place = current_user.created_travel_places.build
  end

  def create
    @travel_place = current_user.created_travel_places.build(travel_place_params)
    @travel_place.save!
    redirect_to travel_places_path, notice: 'Travel place was successfully created.'
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = "Error creating travel place: #{e.message}"
    redirect_to new_travel_place_path
  end
  
  def add_to_favorites
    if current_user.favorite_place?(@travel_place)
      current_user.remove_from_favorites(@travel_place)
    else
      current_user.add_to_favorites(@travel_place)
    end
    redirect_to travel_places_path
  end

  def update
    if @travel_place.update(travel_place_params)
      redirect_to travel_places_path, notice: 'Travel place was successfully updated.'
    else
      flash[:alert] = 'Error updating travel place.'
      redirect_to edit_travel_place_path
    end
  end
  

  def destroy
    @travel_place.destroy
    redirect_to travel_places_path, notice: 'Travel place was successfully destroyed.'
  end

  private

  def travel_place_params
    params.require(:travel_place).permit(:location, :name, :description)
  end

  def find_travel_place
    @travel_place = TravelPlace.find(params[:id])
  end
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:alert] = 'Travel place not found.'
    redirect_to error_path
  end

end
