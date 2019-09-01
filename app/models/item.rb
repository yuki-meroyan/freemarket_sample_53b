class Item < ApplicationRecord

  has_many :comments
  belongs_to :user
  belongs_to :brand
  has_many :item_images             , dependent: :destroy
  belongs_to :category
  has_many :likes                   , dependent: :destroy
  has_one :transaction_informations , dependent: :destroy
  has_ancestry
end
