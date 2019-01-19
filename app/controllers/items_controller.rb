class ItemsController < ApplicationController

  before_action :link_user
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.where('id >= 1').limit(4)
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

  def set_midium_categories
    @midium_category = MidiumCategory.where(category_id: params[:category_id]).select(:id, :name)
    render json: @midium_category
  end


  def detail
    @item = Item.find(params[:item_id])

     unless @item.parent_category.nil?
      large_category = @item.parent_category.large_category
      @large_category = LargeCategory.find(large_category)

      midium_category = @item.parent_category
      @midium_category = MidiumCategory.find(midium_category)

      # small_category = @item.parent_category
      # @small_category = SmallCategory.find(small_category)
    end

  end

  def transaction
  end

  def set_small_categories
    @small_category = SmallCategory.where(category_id: params[:category_id]).select(:id, :name)
    render json: @small_category
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



end
