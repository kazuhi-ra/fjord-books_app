class FollowsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.follow(user)

    redirect_to user_path(user)
  end
end
