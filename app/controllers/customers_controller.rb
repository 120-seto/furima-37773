class CustomersController < ApplicationController

  def index
    @customer_shipping = CustomerShippings.new
  end

  def create
    @customer_shipping =CustomerShippings.new(customer_params)
    if @customer_shipping.valid?
      @customer_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def customer_params
    params.require(:customer_shippings).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end