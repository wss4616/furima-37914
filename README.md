###usersテーブル（ユーザー情報）###
| Column               | Type   | Options     |
| -------------------- | ------ | ------------|
| nickname	           |string	|null: false
| email                |string	|null: false, unique:true
| encrypted_password   |string  |null: false
|family_name	          |string	    |null: false
|first_name	            |string	    |null:false
|family_name_kana	      |string	    |null:false
|first_name_kana	      |string	    |null: false

Association
has_one :user_address, dependent: :destroy
has_many :items, dependent: :destroy, foreign_key: :items
has_many :Purchase Records,dependent: :destroy, foreign_key: :Purchase Records


###itemsテーブル（商品情報）###
| Column                   | Type      | Options     |
| ----------------------   | ------    | ------------|
| name	                   |string     |null: false, index: true
| text	                   |text	     |null: false
| brand_id                 |integer	   |null: false
| status_id	               |integer    |null:false, default: 0
| delivery_charge_bearer_id|integer    |null:false, default: 0
| prefecture_id	           |integer    |null: false, default: 0
| delivery_days_id         |integer    |null:false, default: 0
| price                    |integer    |null:false
| user_id	                 |references	|null: false, foreign_key: true

Association
belongs_to :user
has_many :Purchase Records,dependent: :destroy, foreign_key: :Purchase Records


###user_addressテーブル（発送先情報）###
| Column                | Type      | Options     |
| ----------------------| ----------| ------------|
|post_number	          |string	    |null:false
|prefecture_id	        |integer	  |null:false, default: 0
|city	                  |string	    |null:false
|house_number	          |integer	  |null: false
|building_name	        |string	    |
|phone_number	          |string	    |null:false
|user_id	              |references |	null: false, foreign_key: true

Association
belongs_to :user




###Purchase Recordsテーブル（購入記録）###
| Column                | Type      | Options     |
| ----------------------| ----------| ------------|
|user_id	              |references	|null: false, foreign_key: true
|item_id                |references	|null: false, foreign_key: true

Association
belongs_to :user
belongs_to :item