class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id,	:city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/}
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true }, format:{ with: /\A\d{10,11}\z/, message:"は10桁から11桁の半角数字で記入してください"}
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    UserAddress.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
