class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index 
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



  private

  def index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:name, :text, :brand_id, :status_id, :delivery_charge_bearer_id, :prefecture_id, :delivery_day_id, :image, :price).merge(user_id: current_user.id)

  end
end
