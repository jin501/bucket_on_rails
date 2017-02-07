class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :omniauth_providers => [:facebook, :instagram]

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

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
      else
        user.username = auth.info.email[/[^@]+/]
      end
      user.email = user.username
    end
  end

  def instagram

    # You need to implement the method below in your model (e.g. app/models/user.rb)
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
