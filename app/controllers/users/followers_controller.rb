# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    def index
      @user = User.find(params[:user_id])
      @followers = @user.followers.order(:id).page(params[:page])
    end
  end
end
