require 'rails_helper'

RSpec.describe Card, type: :model do

  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  it "is valid with a :name,:price,:region,:delivery_fee,:delivery_days,:brand_id,:category_id,user_id" do
    item = @item
    expect(item).to be_valid
  end

  # it "is invalid without a user_id" do
  #   user = @user
  #   card = user.cards.build(
  #     customer_id: "cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a",
  #     card_id: "car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1",
  #     user_id: nil
  #   )
  #   card.valid?
  #   expect(card.errors[:user_id]).not_to include("can't be blank") 
  # end

  # it "is invalid without a card_id" do
  #   user = @user
  #   card = user.cards.build(
  #     customer_id: "cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a",
  #     card_id: nil,
  #     user_id: 1
  #   )
  #   card.valid?
  #   expect(card.errors[:card_id]).not_to include("can't be blank") 
  # end

  # it "is invalid without a customer_id" do
  #   user = @user
  #   card = user.cards.build(
  #     customer_id: nil,
  #     card_id: "car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1",
  #     user_id: 1
  #   )
  #   card.valid?
  #   expect(card.errors[:customer_id]).not_to include("can't be blank") 
  # end

end
