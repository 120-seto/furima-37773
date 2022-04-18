class CustomerController < ApplicationController

  def index
    @customer_controller = CustomerShipping.new
  end