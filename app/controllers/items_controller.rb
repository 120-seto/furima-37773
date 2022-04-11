class ItemsController < ApplicationController
  def index
  end
  def new
  end
  def create
  end

  private

  def message_params
    params.require(:item).permit(:customer, :image).merge(user_id: current_user.id)
  end
end
