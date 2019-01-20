class UsersController < ApplicationController

  def choice
  end

  def edit
    current_user.address
    current_user.birth = Birth.new if current_user.birth.blank?
  end

  def new
  end

  def create
  end

  def telephone
  end

  def telephone_confirm
  end

  def profile
  end

  def show
  end

  def logout
  end

  def nickname_email_confirm
  end

  def update
    current_user.update(user_params)
    if current_user.save
      redirect_to new_credit_path
    else
      render template: "addresses/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :phonetic, :phonetic_last, :tel, :email, :nickname, address_attributes: [:id, :user_id, :prefecture, :city, :house_number, :building, :post_code, :created_at, :updated_at, :_destroy], birth_attributes: [:id, :user_id, :year, :month, :day, :_destroy])
  end

end
