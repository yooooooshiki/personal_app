class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many   :likes, dependent: :destroy
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
