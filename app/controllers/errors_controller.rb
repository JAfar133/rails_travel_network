class ErrorsController < ApplicationController
    def error
        @error_message = flash[:alert] || 'Something went wrong.'
    end
end
