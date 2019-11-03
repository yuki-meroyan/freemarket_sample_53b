require 'rails_helper'

RSpec.describe TransactionInformationsController, type: :controller do

  before:each do 
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_buyed = FactoryBot.create(:item_buyed)
  end

  describe "#index" do
    # カード情報が必要なところは割愛
    # @card = FactoryBot.create(:card)

    # 購入済みはページが遷移するか？
    it "responds item buyed redirect to item_path" do
      sign_in @user
      get :index, params: { item_id: @item_buyed }
      expect(response).to redirect_to item_path(id: @item_buyed)
    end
    # 出品者と購入しようとしている人が同一であればページを遷移する
    it "responds Same person redirect to item_path " do
      sign_in @item.user
      get :index, params: { item_id: @item }
      expect(response).to redirect_to item_path(id: @item)
    end
  end
end