require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまくいかない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'categoryが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'statusが1では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'shipping_costが1では登録できない' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it 'shipping_areaが1では登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'shipping_dayが1では登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが299以下だと登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'priceが10000000以上だと登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'ユーザーが紐づいていなければ出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).not_to include 'User must exist'
      end
    end
  end
end
