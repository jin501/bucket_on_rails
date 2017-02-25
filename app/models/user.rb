class User < ApplicationRecord
  extend FriendlyId
  mount_uploaders :avatars, AvatarUploader
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :omniauth_providers => [:facebook, :instagram]

  has_many :follows

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following


  has_many :bukets
  has_many :hastags, through: :bukets
  has_many :goals
  has_many :comments

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.avatar = auth.info.image
      user.full_name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      if auth.info.nickname
        user.username = auth.info.nickname
        user.email = user.username
      else
        user.username = auth.info.email[/[^@]+/]
        user.email = auth.info.email
      end
    end
  end

  def instagram
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_users)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Instagram") if is_navigational_format?
    else
      session["devise.instagram_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
