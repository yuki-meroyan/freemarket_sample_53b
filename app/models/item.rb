class Item < ApplicationRecord

  has_many :comments
  belongs_to :user
  belongs_to :brand
  has_many :item_images                           , dependent: :destroy
  accepts_nested_attributes_for :item_images      , allow_destroy: true, reject_if: :all_blank
  belongs_to :category
  has_many :likes                                 , dependent: :destroy
  has_one :transaction_informations
end


