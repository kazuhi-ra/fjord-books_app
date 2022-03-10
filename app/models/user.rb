# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower_relations, class_name: 'Follow', foreign_key: 'follower_id', inverse_of: 'follower', dependent: :destroy
  has_many :followee_relations, class_name: 'Follow', foreign_key: 'followee_id', inverse_of: 'followee', dependent: :destroy
  has_many :followings, through: :follower_relations, source: :followee
  has_many :followers, through: :followee_relations, source: :follower

  def follow(user)
    follower_relations.find_or_create_by(followee_id: user.id)
  end

  def unfollow(user)
    follower_relations.find_by(followee_id: user.id)&.destroy
  end

  def following?(user)
    follower_relations.where(followee_id: user.id).exists?
  end
end
