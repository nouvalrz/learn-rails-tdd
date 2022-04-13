FactoryBot.define do
  factory :category do
    name { "MyString" }
    sequence :name do |n|
      "category-#{name}"
    end
  end
end
