# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|phonetic|string|null: false|
|user_image|string|
|introduction|text|


### Association
- has_many :comments
- has_many :items
- has_many :purchases
- has_one :address
- has_one :birth
- has_one :credit



## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|post_code|integer|
|building|string|

### Association
- belongs_to :user



## birthesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|


### Association
- belongs_to :user



## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|image|string|null: false|
|description|string|null: false|
|status|integer|null: false|
|delivery_fee|integer|null: false|
|pre_date|integer|null: false|


### Association
- has_many :comments
- belongs_to :user
- has_one :parent_category
- has_one :value
- has_one :purchase



## parent_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- has_one :large_category
- has_one :midium_category
- has_one :small_category



## large_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|paremt_category_id|integer|null: false, foreign_key: true|
|category_name|string|null: false|


### Association
- belongs_to :parent_category


## midium_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|paremt_category_id|integer|null: false, foreign_key: true|
|category_name|string|null: false|

### Association
- belongs_to :parent_category


## small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|paremt_category_id|integer|null: false, foreign_key: true|
|category_name|string|null: false|

### Association
- belongs_to :parent_category



## valuesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|price|string|null: false|
|profit|string|null: false|


### Association
- belongs_to :item



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text|


### Association
- belongs_to :user
- belongs_to :item


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
