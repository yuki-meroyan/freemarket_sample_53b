FactoryBot.define do

  factory :category, class: Category do
    category   { "トップス" }
    ancestry   { 1 }
  end

end