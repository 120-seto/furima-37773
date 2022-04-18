class CustomersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @customer_shipping = CustomerShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @customer_shipping =CustomerShipping.new(customer_params)
    if @customer_shipping.valid?
      @customer_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end
  private

  def customer_params
    params.require(:customer_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id])
  end
end