FactoryBot.define do

  factory :user do
    nickname              { |n| "masterB#{n}" }
    email                 { |n| "masterB#{n}@example.com"}
    password              { "00000000" }
    password_confirmation { "00000000" }
  end

  factory :card do
    user_id           { |n| "#{n}" }
    customer_id       {"cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a"}
    card_id           {"car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1"}
  end

end