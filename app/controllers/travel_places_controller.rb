class TravelPlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :index]
  load_and_authorize_resource

  def index
    @travel_places = TravelPlace.all
  end

  def edit
    @travel_place = TravelPlace.find(params[:id])
  end

  def new
    @travel_place = current_user.created_travel_places.build
  end

  def show
    @travel_place = TravelPlace.find(params[:id])
  end

  def create
    @travel_place = current_user.created_travel_places.build(travel_place_params)
    if @travel_place.save
      redirect_to travel_places_path, notice: 'Travel place was successfully created.'
    else
      render :new
    end
  end
  
  def add_to_favorites
    @travel_place = TravelPlace.find(params[:id])

    if current_user.favorite_place?(@travel_place)
      current_user.remove_from_favorites(@travel_place)
      flash[:notice] = 'Travel place removed from favorites.'
    else
      current_user.add_to_favorites(@travel_place)
      flash[:notice] = 'Travel place added to favorites.'
    end

    redirect_to travel_places_path
  end

  def update
    @travel_place = TravelPlace.find(params[:id])
    if @travel_place.update(travel_place_params)
      redirect_to travel_places_path, notice: 'Travel place was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @travel_place = TravelPlace.find(params[:id])
    @travel_place.destroy
    redirect_to travel_places_path, notice: 'Travel place was successfully destroyed.'
  end

  private

  def travel_place_params
    params.require(:travel_place).permit(:location, :name, :description)
  end
end
