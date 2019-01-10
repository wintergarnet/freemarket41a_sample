class ItemsController < ApplicationController
  before_action :link_user

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
    @item.user_id = current_user.id
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
    params.require(:item).permit(:name, :image, :description, :status, :ship_from, :delivery_fee, :pre_date, value_attributes: [:item_id, :price, :profit]).merge(user_id: current_user.id)
  end

  def link_user
    @user = current_user
  end


end
