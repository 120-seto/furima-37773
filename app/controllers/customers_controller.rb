class CustomersController < ApplicationController

  def index
    @customer_shipping = CustomerShippings.new
  end

  def create
    binding.pry
  end
end