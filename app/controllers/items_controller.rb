class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :ensure_current_user, only: [:edit, :update]
  #before_action :prevent_url, only: [:index, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
     else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :shipping_area_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def ensure_current_user
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to root_path
    end
  end
  #def prevent_url
    #if item.user_id != current_user.id || @item.customer != nil
      #redirect_to root_path
   # end
 # end
end