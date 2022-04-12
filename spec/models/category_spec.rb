require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    category = Category.new(
      name: 'Indonesian'
    )

    expect(category).to be_valid
  end

  # it 'is invalid without a name' do
  #   food = Food.new(
  #     name: nil,
  #     description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
  #     price: 15000.0
  #   )

  #   food.valid?

  #   expect(food.errors[:name]).to include("can't be blank")
  # end
end
