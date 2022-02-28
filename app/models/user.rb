# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follower, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followee, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy
  has_many :followings, through: :follower, source: :followee
  has_many :followers, through: :followee, source: :follower
end
