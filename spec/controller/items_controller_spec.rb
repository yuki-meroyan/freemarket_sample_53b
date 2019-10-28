require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  before:each do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
  end
# items/show
  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: {  id: @item }
    end
  end
# items /index
  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 3)
      expect(assigns(:ladys_items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #edit' do
    it "assigns the requested item to @item" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "renders the :edit template" do
      item = create(:item)
      sign_in item.user
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end
end