# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followee, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy
  has_many :followings, through: :follower, source: :followee
  has_many :followers, through: :followee, source: :follower

  def follow(user_id)
    follower.find_or_create_by(followee_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followee_id: user_id)&.destroy
  end
end
