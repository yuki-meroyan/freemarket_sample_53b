
FactoryBot.define do

  factory :user, class: User do
    nickname              { |n| "masterB#{n}" }
    email                 { |n| "masterB#{n}@example.com" }
    password              { "00000000" }
    password_confirmation { "00000000" }
  end

end