class Users::FollowingsController < ApplicationController
  def index
    @followings = current_user.followings.order(:id).page(params[:page])
    @user = User.find(params[:user_id])
  end
end
