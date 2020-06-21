class Post < ApplicationRecord
  has_rich_text :content
  enum approval: { "published": 0, "prohibit": 1 }
  enum category: {
    "その他": 0,
    "浮気": 1,
    "セックスが下手": 2,
    "DV": 3,
    "ケチ": 4,
    "浪費家": 5,
    "傲慢": 6,
    "卑屈": 7,
    "不倫": 8,
    "セクハラ": 9,
    "ギャンブル": 10,
    "怠惰": 11,
    "ヒモ": 12,
    "モラハラ": 13,
    "不潔": 14,
  }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: 'user'
  has_many :post_comments, dependent: :destroy
  is_impressionable
  alias :comments :post_comments
end
