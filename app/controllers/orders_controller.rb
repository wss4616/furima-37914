class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation
  before_action :sold_out


 def index
 @order_address = OrderAddress.new

 end

 def create
     @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
 end

private


  def set_item
   @item = Item.find(params[:item_id])
  end

  def order_params
   params.require(:order_address).permit(:post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold_out
    redirect_to root_path if @item.orders.present?
  end
end