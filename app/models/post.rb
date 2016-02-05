class Post < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments

  def join_comments
    comments.pluck(:comment).join('\n')
  end
end
