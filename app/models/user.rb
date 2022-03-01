# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower, class_name: 'Follow', foreign_key: 'follower_id', inverse_of: 'follower', dependent: :destroy
  has_many :followee, class_name: 'Follow', foreign_key: 'followee_id', inverse_of: 'followee', dependent: :destroy
  has_many :followings, through: :follower, source: :followee
  has_many :followers, through: :followee, source: :follower

  def follow(user)
    follower.find_or_create_by(followee_id: user.id)
  end

  def unfollow(user)
    follower.find_by(followee_id: user.id)&.destroy
  end

  def following?(user)
    follower.where(followee_id: user.id).exists?
  end
end
