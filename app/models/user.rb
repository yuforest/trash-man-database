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
  has_many :socials, dependent: :destroy
  after_create :init_profile
  alias profile user_profile
  acts_as_paranoid

  def self.from_omniauth(auth)
    user = joins(:socials).where("socials.uid = ?", auth.uid)
                          .where("socials.provider = ?", auth.provider)
                          .first
    if user.present?
      return user
    else
      user = User.new(email: auth.info.email, password: Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.socials.new(provider: auth.provider, uid: auth.uid)
      user.save!
      return user
    end
  end

  def init_profile
    self.build_user_profile.save(validate: false)
  end

  def user_name
    return profile.name if profile.name.present?
    "匿名"
  end

  def user_image(size: :thumb)
    return profile.image.send(size).url if profile.image.present?
    return "default_user.png"
  end

  def total_favorites_count
    posts.inject (0) { |sum, post| sum += post.favorites.count}
  end

  def total_comments_count
    posts.inject (0) { |sum, post| sum += post.comments.count}
  end
end
