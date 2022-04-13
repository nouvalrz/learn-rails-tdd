FactoryBot.define do

  factory :food do
    name { "MyString" }
    description { "MyText" }
    price { 1.5 }
    category_id { 1 }
    
    sequence :name do |n|
      "food-#{name}"
    end
  end
end
