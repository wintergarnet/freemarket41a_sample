class ItemsController < ApplicationController

  before_action :link_user
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :move_to_login, only: [:new, :destroy, :transaction]
  before_action :set_params, only: [:advanced_search]

  def index
    @ladies_items = Item.with_category.search_status('exhibition').where('large_category = 1').limit(4)
    @mans_items = Item.with_category.search_status('exhibition').where('large_category = 2').limit(4)
    @baby_items = Item.with_category.search_status('exhibition').where('large_category = 3').limit(4)
    @cosme = Item.with_category.search_status('exhibition').where('large_category = 7').limit(4)
    @brand_chanel = Item.search_status('exhibition').search_brand("シャネル").limit(4)
    @brand_louisvuitton = Item.search_status('exhibition').search_brand("ルイヴィトン").limit(4)
    @brand_supreme= Item.search_status('exhibition').search_brand("シュプリーム").limit(4)
    @brand_nike = Item.search_status('exhibition').search_brand("ナイキ").limit(4)
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

    @item_sold = @items.where(status: :sold)
    @item_exhibition = @items.where(status: :exhibition_stop).or(@items.where(status: :exhibition))
    @item_trade = @items.where(status: :trade)



  end

  def trade
    @items = Item.where(user_id: current_user.id)
  end

  def sold
    @items = Item.where(user_id: current_user.id)
  end

  def set_midium_category
    @midium_category = MidiumCategory.where(category_id: params[:category_id]).select(:id, :name)
    render json: @midium_category
  end

  def set_small_category
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
    @item = Item.find(params[:id])
    user = @item.user
    @items = user.items.includes(:user).order("created_at DESC").limit(3)
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
    @item = Item.find(params[:id])
  end


  def destroy
    if @item.status == "exhibition"
      if @item.update(status: :exhibition_stop)
      redirect_to root_path
      else
      redirect_to root_path
      end
    end
  end

  def search

    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    @q = Item.ransack(params[:q])
    @value = Value.all
  end

  def advanced_search
    @q = Item.joins(:value, :parent_category).search(search_params)
    @parent_category = ParentCategory.all
    @value = Value.all
    @items = @q.result.includes(:value, :parent_category)
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_condition, :image, :description, :status, :ship_from, :delivery_fee, :pre_date, :user_id, value_attributes: [:id, :item_id, :price, :profit], parent_category_attributes: [:id, :large_category, :midium_category, :small_category]).merge(user_id: current_user.id)
  end
  def search_params
    params.require(:q).permit(:value_price_gteq, :value_price_lteq, :parent_category_large_category_eq, :parent_category_midium_category_eq, :parent_category_small_category_eq, :item_condition_in)
  end

  def link_user
    @user = current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_params
    @parent_category = ParentCategory.all
    @value = Value.all
  end


  def move_to_login
    redirect_to action: :index unless user_signed_in?
  end
end
