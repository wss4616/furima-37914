require 'rails_helper'
RSpec.describe OrderAddress, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1 
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '必須項目が全てあれば出品できる' do
        expect(@order_address).to be_valid
      end
      
      it "tokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end

      it 'building_nameが空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できない場合' do
      it '郵便番号が空では保存できない' do
        @order_address.post_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank", "Post number is invalid")
      end

      it '郵便番号がハイフンなしでは保存できない' do
        @order_address.post_number = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid")
      end

      it '郵便番号が全角数字では保存できない' do
        @order_address.post_number = '１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid")
      end

      it '郵便番号が3桁-4桁の形でしか保存できない' do
        @order_address.post_number = '1111ー111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid")
      end

      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'prefecture_idが---では保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input only number")
      end

      it 'phone_numberが9桁以下では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end

      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end

      it 'phone_numberが半角数値以外は保存できない' do
        @order_address.phone_number = '１１１１２２２２３３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'phone_numberが-を含めると保存できない' do
        @order_address.phone_number = '111-111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
    end
  end
end