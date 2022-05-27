FactoryBot.define do
  factory :order_address do
    post_number                  { '111-1111' }
    prefecture_id                { 2 }
    city                         { '新宿区新宿' }
    house_number                 { '東新宿１−２−３' }
    building_name                { '東ビル3F' }
    phone_number                 { '09012345678' }
    token                        { 'tok_abcdefghijk00000000000000000' }
  end
end