class ItemsController < ApplicationController

  before_action :link_user
  # before_action :set_item, only[:edit, :update]

  def index
    @items = Item.where('id >= 1').limit(4)
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
    #商品詳細ページがないため仮置き
    #TODO: privateのset_itemに変更する
    @item = Item.find(1)
    @item.value
  end

  def update
    #商品詳細ページがないため仮置き
    #TODO: privateのset_itemに変更する
    @item = Item.find(1)
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def list
    @items = Item.where(user_id: current_user.id)
  end
  private

  def item_params
    #TODO: .merge(user_id: current_user.id)として分ける
    params.require(:item).permit(:name, :item_condition, :image, :description, :status, :ship_from, :delivery_fee, :pre_date, value_attributes: [:id, :item_id, :price, :profit]).merge(user_id: current_user.id)
  end

  def link_user
    @user = current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
