class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id,	:city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :post_number, presence: { message: 'は必須項目です' },format: { with: /\A\d{3}-\d{4}\z/, allow_blank: true, message: 'は000-0000の形でのみ登録可能です' }
    validates :prefecture_id, presence:  { message: 'は必須項目です' }
    validates :city, presence:  { message: 'は必須項目です' }
    validates :phone_number, numericality: { only_integer: true, message: 'は必須項目です' }
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    UserAddress.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
