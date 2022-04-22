class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @customer_shipping = CustomerShipping.new
    redirect_to root_path if current_user == @item.user || !@item.customer.nil?
  end

  def new
    @customer_shipping = CustomerShipping.new
  end

  def create
    @customer_shipping = CustomerShipping.new(customer_params)
    if @customer_shipping.valid?
      pay_item
      @customer_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def customer_params
    params.require(:customer_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: customer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
