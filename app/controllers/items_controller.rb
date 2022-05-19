class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  has_one_attached :image

  def index
  end

  def show
  end


  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
