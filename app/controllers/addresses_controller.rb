class AddressesController < ApplicationController

  def credit_registration
    @address = Address.new
  end

  def create
    @address = Address.new
    redirect_to root_path
  end

end


