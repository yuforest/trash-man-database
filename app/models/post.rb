class Post < ApplicationRecord
  has_rich_text :content
  enum approval: { "published": 0, "prohibit": 1 }
  acts_as_paranoid
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: 'user'
  has_many :post_comments, dependent: :destroy
  is_impressionable
  has_many :tags, through: :post_tags
  belongs_to :category
  alias :comments :post_comments
end
