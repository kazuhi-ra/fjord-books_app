# frozen_string_literal: true

module UsersHelper
  def avatar(user:, size:)    
    image_tag user.avatar.variant(resize_to_limit: [size, size], strip: true)
  end
end
