class Category < ActiveHash::Base
  include ActiveHash::Associations
  has_many :posts
  self.data = [
    { id: 1, name: "その他"},
    { id: 2, name: "浮気"},
    { id: 3, name: "セックスが下手"},
    { id: 4, name: "DV"},
    { id: 5, name: "ケチ"},
    { id: 6, name: "浪費家"},
    { id: 7, name: "傲慢"},
    { id: 8, name: "卑屈"},
    { id: 9, name: "不倫"},
    { id: 10, name: "セクハラ"},
    { id: 11, name: "ギャンブル"},
    { id: 12, name: "怠惰"},
    { id: 13, name: "ヒモ"},
    { id: 14, name: "モラハラ"},
    { id: 15, name: "不潔"},
    { id: 16, name: "最低な行為"},
    { id: 17, name: "迷惑"},
  ]
end