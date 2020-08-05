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

  scope :search_by_category, -> (category_id) {
    return if category_id.nil?
    where(category_id: category_id)
  }

  scope :search_by_word, -> (search_word) {
    return if search_word.nil?
    where("title LIKE ?", "%#{search_word}%")
  }

  scope :search_by_tag, -> (tag_id) {
    return if tag_id.nil?
    joins(:tags).where("tags.id = ?", tag_id)
  }


end
