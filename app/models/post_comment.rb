class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true
  validates :user_id, uniqueness: { scope: :post_id }
end
