class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_rich_text :content
  enum approval: { "published": 0, "prohibit": 1 }
  acts_as_paranoid
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: 'user'
  has_many :post_comments, dependent: :destroy
  is_impressionable
  has_many :post_tags
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :post_tags, allow_destroy: true
  belongs_to_active_hash :category
  alias :comments :post_comments

  scope :search_by_user_id, -> (user_id) {
    return if user_id.nil?
    where(user_id: user_id)
  }
end
