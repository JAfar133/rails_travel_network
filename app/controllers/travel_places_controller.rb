class TravelPlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :index]

  def index
    @travel_places = TravelPlace.all
  end

  def edit
    @travel_place = TravelPlace.find(params[:id])
  end

  def new
    @travel_place = current_user.travel_places.build
  end

  def create
    @travel_place = current_user.travel_places.build(travel_place_params)
    if @travel_place.save
      redirect_to travel_places_path, notice: 'Travel place was successfully created.'
    else
      render :new
    end
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
