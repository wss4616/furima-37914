class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :brand
  belongs_to :delivery_charge_bearer
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
  validates :name
  validates :text
  validates :image
  validates :brand_id
  validates :delivery_charge_bearer_id
  validates :prefecture_id
  validates :delivery_day_id
  validates :status_id
  validates :price
  end
  

  with_options numericality: { other_than: 1 } do
   validates :brand_id
   validates :delivery_charge_bearer_id
   validates :prefecture_id
   validates :delivery_day_id
   validates :status_id
  end

  validates_inclusion_of :price, in: 300..9999999
  validates :price, numericality: only_integer: true

end