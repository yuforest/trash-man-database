class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:twitter]
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites
  has_many :post_comment, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  after_create :init_profile
  alias profile user_profile

  def init_profile
    self.build_user_profile.save(validate: false)
  end
end