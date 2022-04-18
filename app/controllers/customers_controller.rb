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
end