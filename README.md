###usersテーブル（ユーザー情報）###
| Column               | Type    | Options     |
| -------------------- | ------  | ------------|
| nickname	           |string	 |null: false
| email                |string	 |null: false, unique:true
| encrypted_password   |string   |null: false
|family_name	         |string   |null: false
|first_name	           |string   |null: false
|family_name_kana	     |string   |null: false
|first_name_kana	     |string	 |null: false
|birthday              |date     |null: false

###Association###
has_many :items, dependent: :destroy
has_many :purchase_records,dependent: :destroy


###itemsテーブル（商品情報）###
| Column                   | Type      | Options     |
| ----------------------   | ------    | ------------|
| name	                   |string     |null: false, index: true
| text	                   |text	     |null: false
| brand_id                 |integer	   |null: false
| status_id	               |integer    |null: false
| delivery_charge_bearer_id|integer    |null: false
| prefecture_id	           |integer    |null: false
| delivery_day_id          |integer    |null: false
| price                    |integer    |null: false
| user	                   |references |null: false, foreign_key: true

###Association###
belongs_to :user
has_many :purchase_records,dependent: :destroy


###user_addressesテーブル（発送先情報）###
| Column                | Type      | Options     |
| ----------------------| ----------| ------------|
|post_number	          |string	    |null:false
|prefecture_id	        |integer	  |null:false
|city	                  |string	    |null:false
|house_number	          |string	    |null: false
|building_name	        |string	    |
|phone_number	          |string	    |null:false
|purchase_record        |references |null:false

###Association###
belongs_to :purchase_record


###purchase_recordsテーブル（購入記録）###
| Column                | Type      | Options     |
| ----------------------| ----------| ------------|
|user	   　　           |references	|null: false, foreign_key: true
|item　　                |references	|null: false, foreign_key: true

###Association###
belongs_to :user
belongs_to :item
has_one : user_address