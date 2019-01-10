class ItemsController < ApplicationController
  def index
  end

  def mypage
  end

  def new
    @item = Item.new
    @item.build_value
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
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    #TODO: .merge(user_id: current_user.id)として分ける
    params.require(:item).permit(:user_id, :name, :image, :description, :status, :delivery_fee, :pre_date, value_attributes: [:item_id, :price, :profit])
  end


end
