class TweetsController < ApplicationController
    before_action :set_user, only: :index

    # list tweets from user one follows
    def index
        @following_user_ids = @user.following.pluck(:id)

        @tweets = Tweet.where(user_id: @following_user_ids).order(created_at: :desc).includes(:user)
        json_response(@tweets)
    end

    # create tweet
    def create
        @tweet = current_user.tweets.build(tweet_params)

        if @tweet.save
            json_response(@tweet, :created)
        else
            json_response({ success: false, message: "Error while creating tweet.", errors: @tweet.errors }, :unprocessable_entity)
        end
    end

    private
    
    def tweet_params
        params.require(:tweet).permit(:content)
    end

    # get user for listing tweets
    def set_user
        @user ||= User.find(params[:user_id])
    end
end
