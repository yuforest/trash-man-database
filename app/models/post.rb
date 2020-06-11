class Post < ApplicationRecord
  has_rich_text :content
  enum approval: { "published": 0, "prohibit": 1 }
  enum category: {
    "その他": 0,
    "浮気": 1,
    "性生活": 2,
    "性格": 3,
    "金銭感覚": 4,
    "行動": 5,
    "態度": 6,
    "外見": 7,
  }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: 'user'
  has_many :post_comments, dependent: :destroy
  is_impressionable
  alias :comments :post_comments
end
