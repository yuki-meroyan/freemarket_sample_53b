
## users
|Column|Type|Options|
|------|----|-------|
|mail|string|null: false, unique: true|
|password|string|null: false|
|nickname|string|null: false|
|icon|string||
|introduction|text||
### Association
- has_many :likes, dependent: :destroy
- has_many :items
- has_many :comments
- has_many :payments
- has_one :user_detail, dependent: :destroy
- has_many :buyer, :class_name => 'TransactionInformations', :foreign_key => 'buyer_id'
- has_many :seller, :class_name => 'TransactionInformations', :foreign_key => 'seller_id'
- has_many :from_user, :class_name => 'TransactionMessages', :foreign_key => 'from_user_id'
- has_many :send_user, :class_name => 'TransactionMessages', :foreign_key => 'send_user_id'

## user_detailsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|
|phone_number|integer|null: false, unique: true|
|postal_code|integer|null: false|
|Prefectures|string|null: false|
|Cities|string|null: false|
|Address|integer|null: false|
|building_name|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text||
|details|ancestry|null: false|
|price|integer|null: false|
|region|string|null: false|
|delivery_fee|boolean|null: false|
|delivery_days|string|null: false|
|shipping_method|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :user
- belongs_to :brand
- has_many :item-images, dependent: :destroy
- belongs_to :category
- has_many :likes, dependent: :destroy
- has_one :transaction_informations, dependent: :destroy
- has_ancestry

## item-imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|ancestry|string|index: true|
### Association
- has_many :items
- has_ancestry

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## transaction_informationsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false|
|buyer_id|integer|null: false|
|purchase_day|integer|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user, foreign_key 'user_id'
- has_many :trnsaction_messages
- belongs_to :buyer, :class_name => 'User'
- belongs_to :seller, :class_name => 'User'

## transaction_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|tansaction_informations_id|refrences|null: false, foreign_key: true|
|from_user_id|integer|null: false|
|send_user_id|integer|null: false|
|send_day|integer|null: false|
### Association
- belongs_to :transaction_informations
- belongs_to :form_user_id, :class_name => 'User'
- belongs_to :send_user_id, :class_name => 'User'
