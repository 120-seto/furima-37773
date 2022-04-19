require 'rails_helper'

RSpec.describe CustomerShipping, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @customer_shipping = FactoryBot.build(:customer_shipping, user_id: user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@customer_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @customer_shipping.building_name = ''
        expect(@customer_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @customer_shipping.post_code = ''
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @customer_shipping.post_code = '1234567'
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'shipping_area_idを選択していないと保存できないこと' do
        @customer_shipping.shipping_area_id = 1
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと保存できないこと'do
        @customer_shipping.city = ''
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @customer_shipping.address = ''
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @customer_shipping.phone_number = ''
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは「10桁以上11桁以内」の半角数値でないと保存できないこと' do
        @customer_shipping.phone_number = '123456789012'
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include('Phone number is invalid. Include hyphen(-)')
      end
      it 'userが紐付いていないと保存できないこと' do
        @customer_shipping.user_id = nil
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @customer_shipping.item_id = nil
        @customer_shipping.valid?
        expect(@customer_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end