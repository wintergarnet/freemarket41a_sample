require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe '#index' do
    let(:item) { create(:item)}

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end

    it 'assigns @items' do
      expect(assigns(:item)).to match(@items)
    end

  end
end
