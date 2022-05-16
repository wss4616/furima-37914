###userテーブル###
| Column               | Type   | Options     |
| -------------------- | ------ | ------------|
| nickname	           |string	|null: false
| email                |string	|null: false, unique:true
| password              |string  |null: false

Association
has_one :profile, dependent: :destroy
has_one :user_address, dependent: :destroy
has_one :card, dependent: :destroy
has_many :items, dependent: :destroy, foreign_key: :items



###itemsテーブル###
| Column                | Type      | Options     |
| ----------------------| ------    | ------------|
| name	                |string     |null: false, index: true
| text	                |text	      |null: false
| brand	                |string	
| status	              |integer    |null:false, default: 0
| delivery_charge_bearer|integer    |null:false, default: 0
| prefecture_id	        |integer    |null: false, default: 0
| delivery_days	        |integer    |null:false, default: 0
| price                 |integer    |null:false
| seller_id	            |references	|null: false, foreign_key: true
| buyer_id	            |references	|foreign_key: true
| category_id	          |references	|null: false, foreign_key: true

Association
belongs_to :user
belongs_to :category
has_many :item_images, dependent: :destroy



###item_imagesテーブル###
| Column                | Type      | Options     |
| ----------------------| ------    | ------------|
|src                    |string     |null:false
|item_id                |references |null:false,foreign_key_true

Association
belongs_to :item



###categoriesテーブル###
| Column                | Type   | Options     |
| ----------------------| ------ | ------------|
|name                   |string  |null:false

Association
has_many :items

###user_addressテーブル###
| Column                | Type      | Options     |
| ----------------------| ----------| ------------|
|family_name	          |string	    |null: false
|first_name	            |string	    |null:false
|family_name_kana	      |string	    |null:false
|first_name_kana	      |string	    |null: false
|post_number	          |string	    |null:false
|prefecture_id	        |integer	  |null:false, default: 0
|city	                  |string	    |null:false
|house_number	          |integer	  |null: false
|building_name	        |string	    |
|phone_number	          |string	    |
|user_id	              |references |	null: false, foreign_key: true

Association
belongs_to :user


###cardテーブル###
| Column                | Type      | Options     |
| ----------------------| ----------| ------------|
|user_id	              |references	|null: false, foreign_key: true
|customer_id            |string	    |null:false

Association
belongs_to :user