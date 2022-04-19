class CustomersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
    @customer_shipping = CustomerShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @customer_shipping =CustomerShipping.new(customer_params)
    if @customer_shipping.valid?
      pay_item
      @customer_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private

  def customer_params
    params.require(:customer_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def pay_item
  Payjp.api_key = "sk_test_d1dab60c6f31f17d1b85ffe7"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: customer_params[:price],  # 商品の値段
    card: customer_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
 end
end