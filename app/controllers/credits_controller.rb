class CreditsController < ApplicationController

  before_action :set_api_key, only: [:pay, :create, :acquire_token]
  before_action :set_card_token, only: [:pay]
  before_action :set_purchase, only: [:pay]
  before_action :set_user, only: [:pay]

  def new
    @credit = Credit.new
  end

  def pay
    @item = Item.find(params[:id])
    if @item.status == '出品中'
      @value = @item.value.price
      charge = Payjp::Charge.create(
        :amount => @value,
        :customer => @customer_token,
        :currency => 'jpy',
      )
      if charge.paid == true
        @item.update!(status: 'sold')
        @purchase.save
      else
        render 'items/transaction'
      end
    else
      render 'items/transaction'
    end
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to root_path
    else
      render :new
    end
  end

  def acquire_token
    customer_id = Payjp::Customer.create(
      card: params[:card_token]
    )
    render json: customer_id
  end


  private

  def set_api_key
    Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
  end

  def set_card_token
    @customer_token = current_user.credit.customer_id
  end

  def set_purchase
    @purchase = Purchase.new
    @purchase.item_id = params[:id]
    @purchase.user_id = current_user.id
  end

  def set_user
    @user = User.find(current_user.id)
  end
  def credit_params
    params.require(:credit).permit(:customer_id).merge(user_id: current_user.id)
  end
end
