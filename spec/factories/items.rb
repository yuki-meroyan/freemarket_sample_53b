FactoryBot.define do

  factory :item, class: Item do
    name            { "テストアイテム" }
    description     { "新品未使用です" }
    ancestry        { 1 }
    price           { 1000 }
    region          { "大阪府" }
    delivery_fee    { 1 }
    delivery_days   { "2~3日で発送" }
    shipping_method { "らくらくメルカリ便" }
    status          { 0 }
    size            { "" }
    saved_state     { "" }
    buyer_id        { 1 }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    association :user, factory: :user
    association :brand, factory: :brand
    association :category, factory: :category
  end


  factory :item_buyed, class: Item do
    name            { "テストアイテム" }
    description     { "新品未使用です" }
    ancestry        { 1 }
    price           { 2000 }
    region          { "大阪府" }
    delivery_fee    { 1 }
    delivery_days   { "2~3日で発送" }
    shipping_method { "らくらくメルカリ便" }
    status          { 1 }
    size            { "" }
    saved_state     { "" }
    buyer_id        { 1 }
    association :user, factory: :user
    association :brand, factory: :brand
    association :category, factory: :category
  end

end