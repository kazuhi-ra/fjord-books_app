class Report < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def editable?(current_user)
    user_id == current_user.id
  end
end
