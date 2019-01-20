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

  describe 'GET #more' do
    it "assigns the requested contact to @item" do
      item = create(:item)
      get :more, params: { item_id: item }
      expect(assigns(:item)).to eq item
    end

    it "renders the :more template" do
      item = create(:item)
      get :more, params: { item_id: item }
      expect(response).to render_template :more
    end
  end

end
