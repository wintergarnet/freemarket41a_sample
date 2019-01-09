class ItemsController < ApplicationController
  def index
  end

  def mypage
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end


  def edit
  end
end
