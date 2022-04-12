class Food < ApplicationRecord

  
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: true, comparison: { greater_than: 0.0 }

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end
