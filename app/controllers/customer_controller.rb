class CustomerController < ApplicationController

  def index
    @customer_shipping = CustomerShipping.new
  end

  def create
  end