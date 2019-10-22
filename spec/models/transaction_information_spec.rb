require 'rails_helper'

RSpec.describe TransactionInformation, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  before do
    @brand = FactoryBot.build(:brand)
  end

  before do
    @category = FactoryBot.build(:category)
  end

  before do
    user = @user
    brand = @brand
    category = @category
    # item = user.brand.category.items.build(
    #   name:           "テストアイテム",
    #   description:     "新品未使用です",
    #   ancestry:        1,
    #   price:           1000,
    #   region:          "大阪府",
    #   delivery_fee:    1,
    #   delivery_days:   "2~3日で発送",
    #   shipping_method: "らくらくメルカリ便",
    #   status:          0,
    #   size:            nil,
    #   saved_state:     nil,
    #   buyer_id:        1,
    #   brand_id:        1,
    #   user_id:         1,
    #   category_id:     1
    # )
    @item = FactoryBot.build(:item)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  it "has a valid factory of item" do
    item = @item
    expect(item).to be_valid
  end


end