require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品できるとき' do
    context '商品を出品できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では登録できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'brand_idが 1 では登録できないこと' do
        @item.brand_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Brand must be other than 1")
      end
      it 'status_idが 1 では登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_charge_bearer_idが 1 では登録できないこと' do
        @item.delivery_charge_bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge bearer must be other than 1")
      end
      it 'prefecture_idが 1 では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'delivery_day_idが空では登録できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが価格が¥300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが価格が¥9,999,999を超えた場合登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceは全角文字では登録できないこと' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceは半角英数混合では登録できないこと' do
        @item.price = "300a"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは半角英語だけでは登録できないこと' do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'userが存在しなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end