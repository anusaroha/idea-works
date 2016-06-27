class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy



  validates :title, presence: true

  def liked_by?(current_user)
     likes.exists?(user: current_user)
    # likes.find_by_user_id user if user
  end


  def like_for(user)
    likes.find_by(user: user)
    # likes.find_by_user_id user
  end
end
