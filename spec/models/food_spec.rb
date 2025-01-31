require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name, description, and category' do
    food = Food.new(
      name: 'Nasi Goreng',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category_id: 1
    )

    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food = Food.new(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category_id: 1
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end
  
  it 'is invalid with less than 2 words name' do
    food = Food.new(
      name: "nasi",
      description: 'Beras yang dimasak',
      price: 15000.0,
      category_id: 1
    )

    food.valid?

    expect(food.errors[:name]).to include("needs to be more than 1 word")
  end

  it 'is invalid without a description' do
    food = Food.new(
      name: 'Nasi Uduk',
      description: nil,
      price: 15000.0,
      category_id: 1
    )

    food.valid?

    expect(food.errors[:description]).to include("can't be blank")
  end

  
  describe 'self#by_letter' do
    it 'should return a sorted array of results that match' do
      food1 = Food.new(
        name: "Nasi Uduk",
        description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
        price: 10000.0,
        category_id: 1
        
      )

      food2 = Food.new(
        name: "Kerak Telor",
        description: "Betawi traditional spicy omelette made from glutinous rice cooked with egg and served with serundeng.",
        price: 8000.0,
        category_id: 1
      )

      food3 = Food.new(
        name: "Nasi Semur Jengkol",
        description: "Based on dongfruit, this menu promises a unique and delicious taste with a small hint of bitterness.",
        price: 8000.0,
        category_id: 1
      
      )

      expect(Food.by_letter("N")).to eq([food3, food1])
    end
  end

  it 'is invalid with a duplicate name' do
    food1 = Food.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 10000.0,
      category_id: 1
    )
    
    food2 = Food.new(
      name: 'Nasi Uduk',
      description: 'Just with a different description.',
      price: 10000.0
    )

    food2.valid?

    expect(food2.errors[:name]).to include("has already been taken")
    
  end

  it 'is invalid with non numeric price' do
    food = Food.new(
      name: 'Nasi Uduk',
      description: nil,
      price: 'Rp. 15000'
    )

    food.valid?
    
    expect(food.errors[:price]).to include("is not a number")
  end

  it 'is invalid with price less than 0.01' do
    food = Food.new(
      name: 'Nasi Uduk',
      description: nil,
      price: 0.00
    )

    food.valid?
    
    expect(food.errors[:price]).to include("must be greater than or equal to 0.01")
  end

end