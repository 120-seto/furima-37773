class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_signed_in, except: :index

  def index
    @item = Item.find(params[:item_id])
    @customer_shipping = CustomerShipping.new
    if current_user == @item.user
      redirect_to root_path
  end
  if @item.user_id != current_user.id
    redirect_to root_path
  end
end

  def new
    @item = Item.find(params[:item_id])
    @customer_shipping = CustomerShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @customer_shipping = CustomerShipping.new(customer_params)
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
    params.require(:customer_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: customer_params[:token],
      currency: 'jpy'
  end
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  root_path
    end
  end
end