FactoryBot.define do

  factory :card, class: Card do
    customer_id   { "cus_a1a1a1a1a1a1a1a1a1a1a1a1a1a1a" }
    card_id       { "car_1a1a1a1a1a1a1a1a1a1a1a1a1a1a1" }
    user_id       { 1 }
  end

end