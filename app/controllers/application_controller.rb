class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :render_not_found

    def render_not_found
        flash[:alert] = 'Page not found.'
        redirect_to error_path
    end
end
