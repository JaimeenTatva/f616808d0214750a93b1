class UsersController < ApplicationController
    before_action :set_user, only: :show

    # to get other user's profile
    def show
        json_response(@user)
    end

    # current logged in user's profile
    def profile
        json_response(current_user)
    end

    private
    
    # set user for getting profile
    def set_user
        @user ||= User.find(params[:id])
    end
end
