class CreditsController < ApplicationController

  before_action :set_api_key, only: [:pay, :create, :acquire_token]
  # before_action :set_card_token, only: [:pay]

  def new
    @credit = Credit.new
  end

  def pay
    customer = Payjp::Customer::create(
      metadata: {user_id: current_user.id}
    )

    debugger;
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

  end

  def credit_params
    params.require(:credit).permit(:customer_id).merge(user_id: current_user.id)
  end
end
