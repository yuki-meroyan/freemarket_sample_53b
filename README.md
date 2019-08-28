<!-- mercari DB -->
<!-- usersテーブル -->
## users
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|icon|text||
|introduction|text||
### Association
- has_many :items, through: :likes
- has_many :comments
- has_many :cards
- has_one :user_detail

## user_detailsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|
|phone_number|integer|null: false|
|postal_code|integer|null: false|
|Prefectures|string|null: false|
|Cities|string|null: false|
|Address|integer|null: false|
|building_name|string||
・ユーザー情報保留情報
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
<!-- |user_id|integer|null: false|外部キーを参照するかしないか迷っています -->
|user_id|integer|null: false, foreign_key: true|
<!-- |item_id|integer|null: false| -->
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
<!-- |user_id|integer|null: false| -->
|tag_id|integer|null: false, foreign_key: true|
<!-- |item|integer|null: false| -->
### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|comment_id|integer|null: false|
|name|string|null: false|
|description|text||
|state|string|null: false|
|price|integer|null: false|
|like|integer||
|size|string|null: false|
|fee_side|string|null: false|
|method|string|null: false|
|region|string|null: false|
|date|string|null: false|

### Association
- has_many :comments
- has_many :users, through: :likes
- has_many :brands
- has_many :photos
- has_many :categorys

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|name|string|null: false|
### Association
- belongs_to :item

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|url|string||
### Association
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
<!-- |ancestry|||調べ中 -->
### Association
- belongs_to :item

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foregin_key: true|
|card_id|string|null: false|
|cusrtmoer_id|string|null: false|
### Association
- belongs_to :user
