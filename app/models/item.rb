class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :burand
  belongs_to :delivery_charge_bearer
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :status

  validates :name, :text, presence: true
  validates :brand_id,                     numericality: { other_than: 1 , message: "can't be blank"} }
  validates :delivery_charge_bearer,       numericality: { other_than: 1 , message: "can't be blank"} }
  validates :prefecture_id,                numericality: { other_than: 1 , message: "can't be blank"} }
  validates :delivery_day,                 numericality: { other_than: 1 , message: "can't be blank"} }
  validates :status_id,                    numericality: { other_than: 1 , message: "can't be blank"} }
end
