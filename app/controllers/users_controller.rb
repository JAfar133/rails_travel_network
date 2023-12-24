class UsersController < ApplicationController
    before_action :authenticate_user!

    def favorites
        @favorite_places = current_user.favorite_places.map(&:travel_place)
    end
end
