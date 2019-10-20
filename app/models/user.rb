class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes       , dependent: :destroy
  has_many :items
  has_many :comments
  has_many :cards
  has_one :user_detail  , dependent: :destroy
  has_many :buyer       , class_name: 'TransactionInformations' , foreign_key: 'buyer_id'
  has_many :seller      , class_name: 'TransactionInformations' , foreign_key: 'seller_id'
  has_many :from_user   , class_name: 'TransactionMessages'     , foreign_key: 'from_user_id'
  has_many :send_user   , class_name: 'TransactionMessages'     , foreign_key: 'send_user_id'
end
