class AddressesController < ApplicationController
  def new
    @item = Address.new
  end
end
