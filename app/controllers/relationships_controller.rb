class RelationshipsController < ApplicationController
    before_action :set_user, only: :create

    # follow user
    def create
        json_response({ success: false, message: "Already following." }, :bad_request) and return if current_user.following?(@tw_user)

        @relationship = current_user.follow!(@tw_user)
        json_response({ success: true, message: "Successfully followed this user.", data: @relationship })
    end

    # unfollow user
    def destroy
        @tw_user = Relationship.find(params[:id]).followed

        @relationship = current_user.unfollow!(@tw_user)
        json_response({ success: true, message: "Successfully unfollowed this user.", data: @relationship })
    end

    private

    # get user for following
    def set_user
        @tw_user ||= User.find(params[:followed_id])
    end
end
