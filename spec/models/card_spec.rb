require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a user_id, customer_id, card_id" do
    user = build(:user)
    card = build(:card)
  end

end

# feature "xxxxx" do
#   before(:each) do
#     @user = create(:user)
#   end
# end

# describe Card do
#   describe '#create' do

#     it "is valid with a user_id, customer_id, card_id" do
#       user = build(:user)
#       # card = build(:card, user_id: user.id, customer_id: "cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a", card_id: "car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1")
#       card = build(:card)
#       # expect(FactoryBot.create(:card)).to be_valid
#       expect(card).to be_valid
#     end

#     # it "is invalid without a user_id" do
#     #   # expect(FactoryBot.build(:user)).to be_valid
#     #   expect(FactoryBot.build(:card, user_id: "")).to_not be_valid
#     #   expect(card.errors[:user_id]).to include("can't be blank")
#     # end

#     # it "is invalid without a customer_id" do
#     #   # expect(FactoryBot.build(:user)).to be_valid
#     #   # card = FactoryBot.build(user_id: 1, customer_id: "", card_id: "car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1")
      
#     #   expect(FactoryBot.build(:card, customer_id: ""))
#     #   card.valid?
#     #   expect(card.errors[:customer_id]).to include("can't be blank")
#     # end

#     # it "is invalid without a card_id" do
#     #   # expect(FactoryBot.build(:user)).to be_valid
#     #   # card = FactoryBot.build(user_id: 1, customer_id: "cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a", card_id: "")
      
#     #   expect(FactoryBot.build(:card, card_id: ""))
#     #   card.valid?
#     #   expect(card.errors[:card_id]).to include("can't be blank")
#     # end

#   end
# end