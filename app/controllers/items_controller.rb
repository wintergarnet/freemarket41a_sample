class ItemsController < ApplicationController

  before_action :link_user
  before_action :set_item, only: [:edit, :update]
  before_action :move_to_login, only: [:new, :destry, :transaction]

  def index
    @ladies_items = Item.joins(:parent_category).where('status = "出品中" AND large_category = 1').limit(4)
    @mans_items = Item.joins(:parent_category).where('status = "出品中" AND large_category = 2').limit(4)
    @baby_items = Item.joins(:parent_category).where('status = "出品中" AND large_category = 3').limit(4)
    @cosme = Item.joins(:parent_category).where('status = "出品中" AND large_category = 7').limit(4)
  end

  def new
    @item = Item.new
    @item.build_value
    @item.build_parent_category
  end

  def create
    Item.transaction do
      @item = Item.new(item_params)
      @item.save!
    end
      redirect_to root_path
    rescue
      render :new
  end

  def show
    @item = Item.new
  end

  def edit
    @item.value
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def list
    @items = Item.where(user_id: current_user.id)
  end

  def trade
    @items = Item.where(user_id: current_user.id)
  end

  def sold
    @items = Item.where(user_id: current_user.id)
  end

  def set_midium_categories
    @midium_category = MidiumCategory.where(category_id: params[:category_id]).select(:id, :name)
    render json: @midium_category
  end

  def set_small_categories
    @small_category = SmallCategory.where(category_id: params[:category_id]).select(:id, :name)
    render json: @small_category
  end

  def show_more
    @item = Item.find(params[:item_id])
    @items = Item.order("created_at DESC").limit(3)
    unless @item.parent_category.nil?
     large_cate_number = @item.parent_category.large_category
     @large_category = LargeCategory.find(large_cate_number)
     midium_cate_number = @item.parent_category.midium_category
     @midium_category = MidiumCategory.find(midium_cate_number)
     small_cate_number = @item.parent_category.small_category
     @small_category = SmallCategory.find(small_cate_number)
    end
  end


  def detail
    @item = Item.find(params[:item_id])

     unless @item.parent_category.nil?
      large_cate_number = @item.parent_category.large_category
      @large_category = LargeCategory.find(large_cate_number)

      midium_cate_number = @item.parent_category.midium_category
      @midium_category = MidiumCategory.find(midium_cate_number)

      small_cate_number = @item.parent_category.small_category
      @small_category = SmallCategory.find(small_cate_number)
    end
  end

  def transaction
    @item = Item.find(params[:item_id])
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_condition, :image, :description, :status, :ship_from, :delivery_fee, :pre_date, :user_id, value_attributes: [:id, :item_id, :price, :profit], parent_category_attributes: [:id, :large_category, :midium_category, :small_category]).merge(user_id: current_user.id)
  end

  def link_user
    @user = current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_login
    redirect_to action: :index unless user_signed_in?
  end
end
