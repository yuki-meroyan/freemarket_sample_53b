class Card < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :customer_id, presence: true
  validates :card_id, presence: true

  FactoryBot.define do

    factory :user do
      nickname              {"abe"}
      email                 {"kkk@gmail.com"}
      password              {"00000000"}
      password_confirmation {"00000000"}
    end

    factory :card do
      user_id           {"1"}
      customer_id       {"cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a"}
      card_id           {"car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1"}
    end
  
  end
  # card = Card.new(user_id: "", customer_id: "cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a", card_id: "car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1")
end
