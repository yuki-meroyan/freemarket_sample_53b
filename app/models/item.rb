class Item < ApplicationRecord

  has_many    :comments
  belongs_to  :user
  belongs_to  :brand
  has_many    :item_images                        , dependent: :destroy
  accepts_nested_attributes_for :item_images      , allow_destroy: true, reject_if: proc{ |attributes| attributes['image'].blank? }
  belongs_to  :category
  has_many    :likes                              , dependent: :destroy
  has_one      :transaction_informations

  validates :name                                 , presence: true, length: { in: 1..40 }
  validates :description                          , length: { maximum: 1000 }
  validates :price                                , presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :region                               , presence: true
  validates :delivery_fee                         , inclusion: {in: [true, false]}
  validates :delivery_days                        , presence: true
  validates :shipping_method                      , presence: true
  validates :brand                                , presence: true
  validates :user                                 , presence: true
  validates :category                             , presence: true
end


