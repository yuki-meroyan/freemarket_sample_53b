class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:google_oauth2,:facebook]
  has_many :likes       , dependent: :destroy
  has_many :items
  has_many :comments
  has_many :cards
  has_one :user_detail  , dependent: :destroy                   , foreign_key: 'user_id'
  has_many :buyer       , class_name: 'TransactionInformations' , foreign_key: 'buyer_id'
  has_many :seller      , class_name: 'TransactionInformations' , foreign_key: 'seller_id'
  has_many :from_user   , class_name: 'TransactionMessages'     , foreign_key: 'from_user_id'
  has_many :send_user   , class_name: 'TransactionMessages'     , foreign_key: 'send_user_id'

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    # 登録されていなかった時の処理
    unless user
      user = User.create(
        nickname: auth.extra.raw_info.name,
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    # 登録されていた時の処理。
    user
  end

  protected
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(
          nickname: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
