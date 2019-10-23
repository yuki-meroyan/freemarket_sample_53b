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
    @item = FactoryBot.build(:item)
    @item_buyed = FactoryBot.build(:item_buyed)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  it "has a valid factory of item" do
    item = @item
    expect(item).to be_valid
  end

  it "has a valid factory of item_buyed" do
    item_buyed = @item_buyed
    expect(item_buyed).to be_valid
  end


end