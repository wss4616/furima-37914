class UserAddresses
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id,	:city, :house_number, :building_name, :phone_number, :order, :token

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id	
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true }
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
  
end