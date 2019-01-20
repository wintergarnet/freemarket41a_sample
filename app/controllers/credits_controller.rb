class CreditsController < ApplicationController

  before_action :set_api_key, only: [:pay, :create, :acquire_token]

  def new
    @credit = Credit.new
  end

  def pay
    Payjp::Charge.create(
      :amount => 3500,
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
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
    Payjp::Customer.create(
      card: params[:card_token],
      metadata: {user_id: current_user.id}
    )
    render json: params
  end


  private

  def set_api_key
    Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
  end

  def credit_params
    params.require(:credit).permit(:card_token).merge(user_id: current_user.id)
  end
end
