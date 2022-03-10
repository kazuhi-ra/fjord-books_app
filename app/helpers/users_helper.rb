# frozen_string_literal: true

module UsersHelper
  def avatar(user:, size:)    
    image_tag user.avatar.variant(resize_to_limit: [size, size], format: :jpeg, sampling_factor: "4:2:0", strip: true, interlace: "JPEG", colorspace: "sRGB", quality: 80), size: "#{size}x#{size}"
  end
end
